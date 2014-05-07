class DecksController < ApplicationController

  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(params[:deck])
    if @deck.save
      redirect_to @deck
    else
      render 'new'
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

end
