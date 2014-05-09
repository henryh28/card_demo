class CardsController < ApplicationController

  def new
    @deck = Deck.find(params[:deck_id])
  end

  def create
    @deck = Deck.find(params[:deck_id])
    new_card = @deck.cards.create(params[:card])
    redirect_to deck_path(@deck)
  end

end
