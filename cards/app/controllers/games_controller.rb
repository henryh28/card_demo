class GamesController < ApplicationController


  def new
    @player_discard = Array.new
    @player_deck = Deck.find_by_name("starting")
    @player_hand = @player_deck.cards.shuffle![0..4]
    @round_stats = Round.create(buy: 1, action: 1, credit: 0)
  end

  def play
    p "$$$$$$$$$$$$"
    p params[:discard]
    p "*********"
    p params[:hand]
    params[:hand] = params[:discard] | params[:hand] if !params[:discard].nil?
    p "@@@@@@@@@"
    p params[:hand]
    # total_discards.delete("0")
    @discard = params[:hand].map { |card_id| Card.find(card_id) }
  end

end
