class GamesController < ApplicationController

  def new
    @player_discard = Array.new
    @player_deck = Deck.find_by_name("starting").cards
    @player_hand = @player_deck.shuffle!.slice!(0..4)
    @round_stats = Round.create(buy: 1, action: 1, credit: 0)
  end

  def play
    total_discards = params[:discard].nil? ? params[:hand] : (params[:discard] | params[:hand])
    @player_discard = total_discards.map { |card_id| Card.find(card_id) }
    @player_deck = (params[:deck] - params[:hand]).map { |card_id| Card.find(card_id) }

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
    @round_stats = Round.create(buy: 1, action: 1, credit: 0)
  end

end
