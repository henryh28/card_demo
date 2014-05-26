class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_player

  def set_player
    @player = session[:player] if session[:player]
  end


  def initialize_player(shipstat_hash)
    session[:player] = User.new
    @player = session[:player]

    @player.hull = shipstat_hash["max_hull"]
    @player.energy = shipstat_hash["max_energy"]
    @player.shield = shipstat_hash["max_shield"]
    @player.crew = shipstat_hash["max_crew"]
    @player.fuel = shipstat_hash["max_fuel"]
    @player.hardpoint = shipstat_hash["max_hardpoint"]
    @player.speed = shipstat_hash["max_speed"]
    @player.credit = 0
    @player.cargo_bay = shipstat_hash["cargo_bay"]
    @player.cargo = 0
    @player.cargo_bay = []
    @player.attack = 0

    session[:player_discard] = []
    session[:player_deck] = Deck.find_by_name("starting").cards.shuffle!
    session[:player_hand] = session[:player_deck].slice!(0..4)
  end


  def initialize_system
    session[:event_discard], session[:buy_discard] = [], []

    easy_deck = Deck.find_by_name("main_easy").cards.shuffle!
    medium_deck = Deck.find_by_name("main_medium").cards.shuffle!
    session[:event_deck] = easy_deck + medium_deck
    session[:event_hand] = session[:event_deck].slice!(0..2)

    session[:buy_deck] = Deck.find_by_name("buy").cards.shuffle!
    session[:buy_hand] = session[:buy_deck].slice!(0..2)
  end


  def round_housekeeping
    session[:event_hand].each do |card|
      damage_ship(card.modifier) if card.effect == "hull"
    end
  end


  def damage_ship(damage_amount)
    if damage_amount.to_i.abs < @player.shield
      @player.shield += damage_amount.to_i
    else
      hull_damage = damage_amount.to_i.abs - @player.shield
      @player.shield = 0
      @player.hull -= hull_damage
    end
  end


  def discard_cards
    (session[:player_discard] += session[:player_hand]).uniq
    (session[:event_discard] += session[:event_hand]).uniq
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


  def refresh_buy_deck?
    if session[:buy_hand].size < 3 && session[:buy_deck].size > 3
      draw_amount = 3 - session[:buy_hand].size
      draw_amount.times { session[:buy_hand].push(session[:buy_deck].slice!(0)) }
    end
  end


  def compute_attack
    enemy_strength = @event_card.modifier.to_i.abs
    if @player.attack >= enemy_strength && power_check(enemy_strength)
      @player.energy -= enemy_strength
      @player.attack -= enemy_strength
      session[:event_discard].push(session[:event_hand].delete(@event_card))
      @player.credit += @event_card.cost.to_i
      flash[:notice] = "boom!"
    else
      flash[:notice] = "Not enough resources to attack enemy ship"
    end
  end

  def power_check(needed_power)
    @player.energy >= needed_power
  end


  def loot_cargo
    if @player.cargo + @event_card.modifier.to_i <= session[:ship].max_cargo
      @player.cargo += @event_card.modifier.to_i
      p "=== player cargo space now #{@player.cargo}"
      @player.cargo_bay.push(@event_card)
      session[:event_hand].delete(@event_card)
      flash[:notice] = "Loaded #{@event_card.flavor_text} into cargo bay. Space: #{@player.cargo}/#{session[:ship].max_cargo}"
    else
      flash[:notice] = "Not enough room in cargo bay"
    end
  end


  def repair_ship
   if @player.hull < session[:ship].max_hull && @player.credit >= 500
      @player.credit -= 500
      @player.hull += 1
      flash[:notice] = "Repaired 1 hull for 500 credits"
    elsif @player.hull >= session[:ship].max_hull
      flash[:notice] = "Hull at maximum"
    elsif @player.credit < 500
      flash[:notice] = "Insufficient credits for repair"
    end
  end
end
