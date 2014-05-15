class GamesController < ApplicationController


  def new
    @player_discard = 0
    @player_deck = Deck.find_by_name("starting")
    @player_hand = @player_deck.cards.shuffle![0..4]
    @round_stats = Round.create(buy: 1, action: 1, credit: 0)
  end

  def play
    puts "$$$$$$$$$"
    # puts params.inspect
    # puts "*********"
    # p params[:discard].split(",").class
    # p params[:hand].class
    # puts "&&&&&&&&&&&&&"
    p total_discards = params[:discard].split(",").concat(params[:hand])
    p total_discards.delete("0")
    p total_discards
    # p @discard = Array.new
    # p total_discards.each { |card| @discard.push Card.where(id: card)}
    @discard = Card.where(id: total_discards)
    p @discard.inspect
  end

end
