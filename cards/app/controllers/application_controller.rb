class ApplicationController < ActionController::Base
  protect_from_forgery

  def draw_new_hand
    if @player_deck.size >= 5
      @player_hand = @player_deck.slice!(0..4)
    else
      remaining_cards = @player_deck.size
      @player_hand = @player_deck.slice!(0..remaining_cards-1)
      @player_deck = @player_discard.shuffle!
      draw_amount = 5 - remaining_cards
      draw_amount.times { @player_hand.push(@player_deck.slice!(0)) }
      @player_discard = Array.new
    end
  end

  def discard_hand
    total_discards = params[:player_discard].nil? ? params[:player_hand] : (params[:player_discard] | params[:player_hand])
    @player_discard = total_discards.map { |card_id| Card.find(card_id) }
  end

  def discard_event
    event_discards = params[:event_discard].nil? ? params[:event_hand] : (params[:event_discard] | params[:event_hand])
    @event_discard = event_discards.map { |card_id| Card.find(card_id) }
  end

  def draw_new_events
    if @event_deck.size >= 3
      @event_hand = @event_deck.slice!(0..2)
    else
      remaining_cards = @event_deck.size
      @event_hand = @event_deck.slice!(0..remaining_cards-1)
      @event_deck = @event_discard.shuffle!
      draw_amount = 3 - remaining_cards
      draw_amount.times { @event_hand.push(@event_deck.slice!(0)) }
      @event_discard = Array.new
    end
  end

  def refresh_buy_deck?
    if params[:buy_hand].size < 3
      @buy_hand = params[:buy_hand].map { |card_id| Card.find(card_id) }
      @buy_deck = params[:buy_deck].map { |card_id| Card.find(card_id) }
      @buy_hand.push * @buy_deck.slice!(0..draw_amount)
    else
      @buy_hand = params[:buy_hand].map { |card_id| Card.find(card_id) }
      @buy_deck = params[:buy_deck].map { |card_id| Card.find(card_id) }
    end
  end

end
