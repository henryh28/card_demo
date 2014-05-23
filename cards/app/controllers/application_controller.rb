class ApplicationController < ActionController::Base
  protect_from_forgery

  def initialize_variables
    session[:player_discard], session[:event_discard], session[:buy_discard] = [], [], []

    session[:player_deck] = Deck.find_by_name("starting").cards.shuffle!
    session[:player_hand] = session[:player_deck].slice!(0..4)

    session[:event_deck] = Deck.find_by_name("main").cards.shuffle!
    session[:event_hand] = session[:event_deck].slice!(0..2)

    session[:buy_deck] = Deck.find_by_name("buy").cards.shuffle!
    session[:buy_hand] = session[:buy_deck].slice!(0..2)

    @round_stats = Round.new
    @event_round = Round.new

    session[:hull] = 10
    session[:shield], session[:energy], session[:credit] = 0, 0, 0
  end


  def round_housekeeping
    session[:event_hand].each do |card|
      if card.effect == "credit" || card.effect == "energy"
        session[:"#{card.effect}"] += card.modifier.to_i
      elsif card.effect == "hull"
        damage_ship(card.modifier)
      end
    end
  end


  def damage_ship(damage_amount)
    if damage_amount.to_i.abs < session[:shield]
      session[:shield] += damage_amount.to_i
    else
      hull_damage = damage_amount.to_i.abs - session[:shield]
      session[:shield] = 0
      session[:hull] -= hull_damage
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
      session[:"#{discard}"] = Array.new
    end
  end


  def refresh_buy_deck?
    if session[:buy_hand].size < 3
      draw_amount = 3 - session[:buy_hand].size
      draw_amount.times { session[:buy_hand].push(session[:buy_deck].slice!(0)) }
    end
  end


  def compute_attack
    enemy_strength = @event_card.modifier.to_i.abs
    if session[:attack] >= enemy_strength && power_check(enemy_strength)
      session[:energy] -= enemy_strength
      session[:event_discard].push(session[:event_hand].delete(@event_card))
      flash[:notice] = "boom!"
    else
      flash[:notice] = "Not enough resources to attack enemy ship"
    end
  end

  def power_check(needed_power)
    session[:energy] >= needed_power
  end

end
