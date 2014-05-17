class GamesController < ApplicationController

  def new
    @player_discard = Array.new
    @player_deck = Deck.find_by_name("starting").cards
    @player_hand = @player_deck.shuffle!.slice!(0..4)
    @round_stats = Round.new(buy: 1, action: 1, credit: 0, energy: 0)
    @event_deck = Deck.find_by_name("main").cards
    @event_hand = @event_deck.shuffle!.slice!(0..2)
    @buy_deck = Deck.find_by_name("buy").cards
    @buy_hand = @buy_deck.shuffle!.slice!(0..2)
  end

  def play
    discard_hand
    @player_deck = (params[:player_deck] - params[:player_hand]).map { |card_id| Card.find(card_id) }
    draw_new_hand
    @round_stats = Round.new(buy: 1, action: 1, credit: 0, energy: 0)
    discard_event
    @event_deck = (params[:event_deck] - params[:event_hand]).map { |card_id| Card.find(card_id) }
    draw_new_events
    refresh_buy_deck?
  end

end
