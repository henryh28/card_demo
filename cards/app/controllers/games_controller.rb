class GamesController < ApplicationController

  def new
    @player_discard = Array.new
    @player_deck = Deck.find_by_name("starting").cards
    @player_hand = @player_deck.shuffle!.slice!(0..4)
    @round_stats = Round.create(buy: 1, action: 1, credit: 0)
  end

  def play
    p "$$$$$$$$$"
    puts params.inspect
    total_discards = params[:discard].nil? ? params[:hand] : (params[:discard] | params[:hand])
    p "------------ discard pile is ---------"
    puts total_discards.inspect

    @player_discard = total_discards.map { |card_id| Card.find(card_id) }
    p "--------- current discard pile is ---------"
    p @player_discard.each { |x| p x.id}

    @player_deck = (params[:deck] - params[:hand]).map { |card_id| Card.find(card_id) }
    p "--------- current deck draw pile is ---------"
    p @player_deck.each { |x| p x.id }



    if @player_deck.size >= 5
      puts "((((((((((((((((((((( here be problem )))))))))))))))"
      @player_hand = @player_deck.slice!(0..4)
    else
      remaining_cards = @player_deck.size
      puts " ^^^^^^^^^^^^^^^^^^ remaining_cards: #{remaining_cards}"
      @player_hand = @player_deck.slice!(0..remaining_cards-1)
      @player_deck = @player_discard.shuffle!
      draw_amount = 5 - remaining_cards
      draw_amount.times { @player_hand.push(@player_deck.slice!(0)) }
      p "&&&&&&&&&&&& the hand &&&&&&&"
      p @player_hand.each { |x| p x.id }
      p "&&&&&&&&&&&& the deck &&&&&&&"
      p @player_deck.each { |x| p x.id }
      @player_discard = Array.new
      p "&&&&&&&&&&&& the discard &&&&&&&"
      p @player_discard.each { |x| p x.id }


    end
    @round_stats = Round.create(buy: 1, action: 1, credit: 0)

    p "------------- current hand will be -------------"
    p @player_hand.each { |x| p x.id }


  end

end
