class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_player

# -------------------- System Related -----------------
  def set_player
    @player = session[:player] if session[:player]
  end


  def initialize_player(shipstat_hash)
    session[:player] = User.new
    @player = session[:player]

    @player.hull = shipstat_hash["max_hull"]
    @player.energy = shipstat_hash["max_energy"]
    @player.shield = shipstat_hash["max_shield"]
    @player.crew = 3
    @player.fuel = shipstat_hash["max_fuel"]
    @player.hardpoint = 1
    @player.speed = shipstat_hash["max_speed"]
    @player.credit = 10000
    @player.cargo_bay = shipstat_hash["cargo_bay"]
    @player.cargo = 0
    @player.cargo_bay = []
    @player.attack = 0

    session[:player_discard] = []
    session[:player_deck] = Deck.find_by_name("starting").cards.shuffle!
    session[:player_hand] = session[:player_deck].slice!(0..(@player.crew-1))
  end


  def initialize_system
    session[:event_discard], session[:buy_discard] = [], []

    easy_deck = Deck.find_by_name("main_easy").cards.shuffle!
    medium_deck = Deck.find_by_name("main_medium").cards.shuffle!
    hard_deck = Deck.find_by_name("main_hard").cards.shuffle!
    session[:event_deck] = easy_deck.drop(5) + medium_deck.drop(5) + hard_deck.drop(5)
    session[:event_hand] = session[:event_deck].slice!(0..(@player.speed-1))

    session[:buy_deck] = Deck.find_by_name("buy").cards.shuffle!
    session[:buy_hand] = session[:buy_deck].slice!(0..2)

    session[:penalty_deck] = Card.where(card_type: "malfunction")
    session[:game_round_limit] = 50
  end


  def game_over?
    if @player.credit > 50000
      session[:game_status] = "win"
    elsif @player.hull < 1 || @player.round >= session[:game_round_limit].to_i
      session[:game_status] = "lost"
    else
      session[:game_status] = "continue"
    end
  end

# -------------------- Round Upkeep -----------------
  def round_housekeeping
    discard_cards
    session[:location]="space"
    current_speed = params[:speed] ? params[:speed].to_i : @player.speed

    draw_new_cards("player_deck", "player_discard", "player_hand", @player.crew)
    draw_new_cards("event_deck", "event_discard", "event_hand", current_speed)

    tally_resources
    event_tally
  end


  def discard_cards
    (session[:player_discard] += session[:player_hand]).uniq
    (session[:event_discard] += session[:event_hand]).uniq
    @player.round += 1
  end


  def draw_new_cards(deck, discard, hand, hand_size)
    if session[:"#{deck}"].size >= hand_size
      session[:"#{hand}"] = session[:"#{deck}"].slice!(0..(hand_size-1))
    else
      draw_amount = hand_size - session[:"#{deck}"].size
      session[:"#{hand}"] = session[:"#{deck}"].slice!(0..-1)
      session[:"#{deck}"] = session[:"#{discard}"].shuffle!
      draw_amount.times { session[:"#{hand}"].push(session[:"#{deck}"].slice!(0)) }
      session[:"#{discard}"] = []
    end
  end


  def tally_resources
    player_stats = ["attack", "energy"]
    session[:player_hand].each do |card|
      max_charge_amount = player_stats.include?(card.effect) ? session[:ship][:"max_#{card.effect}"] - @player[:"#{card.effect}"] : 0
      if (max_charge_amount >= 0) && (card.modifier.to_i < max_charge_amount) && player_stats.include?(card.effect)
        @player[:"#{card.effect}"] += card.modifier.to_i
      elsif player_stats.include?(card.effect)
        @player[:"#{card.effect}"] = session[:ship][:"max_#{card.effect}"]
      end
    end
  end


  def event_tally
    session[:event_hand].each do |card|
      if card.effect == "energy"
        @player[:"#{card.effect}"] += card.modifier.to_i
        @player[:"#{card.effect}"] = 0 if @player[:"#{card.effect}"] < 1 && card.effect != "credit"
      elsif card.effect == "hull"
        damage_ship(card.modifier)
      end
    end
  end


# -------------------- Space Events -----------------
  def damage_ship(damage_amount)
    if damage_amount.to_i.abs < @player.shield * @player.shield_efficiency
      block_needed = 1
      until block_needed * @player.shield_efficiency >= damage_amount.to_i.abs do
        block_needed += 1
      end
      @player.shield -= block_needed
    else
      hull_damage = damage_amount.to_i.abs - (@player.shield * @player.shield_efficiency)
      @player.shield = 0
      @player.hull -= hull_damage
      hull_damage.times { session[:player_discard].push(session[:penalty_deck].slice!(0)) }
    end
  end


  def compute_attack
    enemy_strength = @event_card.modifier.to_i.abs
    shots_needed = (enemy_strength.to_f / @player.attack_efficiency).ceil
    if @player.attack * @player.attack_efficiency >= enemy_strength && @player.energy >= shots_needed
      @player.energy -= shots_needed
      @player.attack -= shots_needed
      session[:event_discard].push(session[:event_hand].delete(@event_card))
      @player.credit += @event_card.cost.to_i
      flash[:notice] = "boom!"
    else
      flash[:notice] = "Not enough resources to attack enemy ship"
    end
  end


  def loot_cargo
    if @player.cargo + @cargo_card.modifier.to_i <= session[:ship].max_cargo
      @player.cargo += @cargo_card.modifier.to_i
      @player.cargo_bay.push(@cargo_card)
      session[:event_hand].delete(@cargo_card)
      flash[:notice] = "Loaded #{@cargo_card.flavor_text} into cargo bay. Space: #{@player.cargo}/#{session[:ship].max_cargo}"
    else
      flash[:notice] = "Not enough room in cargo bay"
    end
  end


  def enemy_present?
    session[:event_hand].any? { |card| card.card_type == "enemy"}
  end


# -------------------- Station Activities -----------------
  def refresh_buy_deck
    (session[:buy_discard] += session[:buy_hand]).uniq
    draw_new_cards("buy_deck", "buy_discard", "buy_hand", 3)
  end


  def repair_ship
   if @player.hull < session[:ship].max_hull && @player.credit >= 500
      @player.credit -= 500
      @player.hull += 1
      remove_malfunction_card
      flash[:notice] = "Repaired 1 hull for 500 credits"
    elsif @player.hull >= session[:ship].max_hull
      flash[:notice] = "Hull at maximum"
    elsif @player.credit < 500
      flash[:notice] = "Insufficient credits for repair"
    end
  end


  def hire_crew
    if @player.crew < session[:ship].max_crew && @player.credit >= 3000
      @player.credit -= 3000
      @player.crew +=1
      flash[:notice] = "Crew hired."
    elsif @player.crew >= session[:ship].max_crew
      flash[:notice] = "Ship berth at maximum capacity."
    elsif @player.credit < 3000
      flash[:notice] = "Sorry, I don't work for free."
    end
  end


  def recharge_energy
    if @player.energy < session[:ship].max_energy && @player.credit >= 100
      @player.credit -= 100
      @player.energy +=1
      flash[:notice] = "Recharged 1 unit of energy."
    elsif @player.energy >= session[:ship].max_energy
      flash[:notice] = "Power reserves full."
    elsif @player.credit < 100
      flash[:notice] = "No freebies"
    end
  end


  def recharge_shield
    if @player.shield < session[:ship].max_shield && @player.credit >= 250
      @player.credit -= 250
      @player.shield +=1
      flash[:notice] = "Shield capacitor charged by 1 unit."
    elsif @player.shield >= session[:ship].max_shield
      flash[:notice] = "Shield capacitor at maximum."
    elsif @player.credit < 250
      flash[:notice] = "No freebies"
    end
  end


  def remove_malfunction_card
    if session[:player_hand].any? { |card| card.card_type == "malfunction" }
      session[:player_hand].delete(session[:player_hand].find { |card| card.card_type == "malfunction"} )
    elsif session[:player_discard].any? { |card| card.card_type == "malfunction" }
      session[:player_discard].delete(session[:player_discard].find { |card| card.card_type == "malfunction"} )
    else session[:player_deck].any? { |card| card.card_type == "malfunction" }
      session[:player_deck].delete(session[:player_deck].find { |card| card.card_type == "malfunction"} )
    end
  end


  def install_upgrade
    if @buy_card.effect == "weapon"
      @player.attack_efficiency = @buy_card.modifier.to_i
    elsif @buy_card.effect == "shield"
      @player.shield_efficiency = @buy_card.modifier.to_i
    elsif @buy_card.effect == "engine"
      session[:ship].max_speed = @buy_card.modifier.to_i
    elsif @buy_card.effect == "hull"
      session[:ship].max_hull = @buy_card.modifier.to_i
    else
      session[:ship][:"max_#{@buy_card.effect}"] = @buy_card.modifier.to_i
    end
  end

end
