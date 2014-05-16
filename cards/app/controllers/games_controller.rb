class GamesController < ApplicationController

  def new
    @player_discard = Array.new
    @player_deck = Deck.find_by_name("starting").cards
    @player_hand = @player_deck.shuffle!.slice!(0..4)
    @round_stats = Round.new(buy: 1, action: 1, credit: 0, energy: 0)
  end

  def play
    discard_hand
    @player_deck = (params[:deck] - params[:hand]).map { |card_id| Card.find(card_id) }
    draw_new_hand
    @round_stats = Round.new(buy: 1, action: 1, credit: 0, energy: 0)
  end

end
