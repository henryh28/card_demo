class GamesController < ApplicationController

  def new
    @player_deck = Deck.find_by_name("starting")
    @player_hand = @player_deck.cards.shuffle![0..4]
  end

end
