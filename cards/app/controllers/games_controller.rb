class GamesController < ApplicationController

  def new
    @player_deck = Deck.find_by_name("starting")
  end

end
