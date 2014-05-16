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
    total_discards = params[:discard].nil? ? params[:hand] : (params[:discard] | params[:hand])
    @player_discard = total_discards.map { |card_id| Card.find(card_id) }
  end

end
