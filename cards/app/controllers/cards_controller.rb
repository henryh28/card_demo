class CardsController < ApplicationController

  def new
    @deck = Deck.find(params[:deck_id])
  end

  def create
    @deck = Deck.find(params[:deck_id])
    new_card = @deck.cards.create(params[:card])
    redirect_to deck_path(@deck)
  end

  def edit
    @deck = Deck.find(params[:deck_id])
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      redirect_to @deck
    else
      render "edit"
    end
  end

  def show
    @card = Card.find(params[:id])
  end


end
