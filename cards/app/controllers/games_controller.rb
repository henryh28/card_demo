class GamesController < ApplicationController

  def new
    session[:player_discard] = Array.new
    session[:player_deck] = Deck.find_by_name("starting").cards.shuffle!
    session[:player_hand] = session[:player_deck].slice!(0..4)

    session[:event_discard] = Array.new
    session[:event_deck] = Deck.find_by_name("main").cards.shuffle!
    session[:event_hand] = session[:event_deck].slice!(0..2)

    session[:buy_discard] = Array.new
    session[:buy_deck] = Deck.find_by_name("buy").cards.shuffle!
    session[:buy_hand] = session[:buy_deck].slice!(0..2)

    @round_stats = Round.new
    session[:hull] = 10
    session[:shield] = 0
    session[:energy] = 0
    session[:credit] = 0
    render "play"
  end

  def play
    player_hand_size = 5
    event_hand_size = 3
    discard_cards
    draw_new_cards("player_deck", "player_discard", "player_hand", player_hand_size)
    draw_new_cards("event_deck", "event_discard", "event_hand", event_hand_size)
    @round_stats = Round.new
    refresh_buy_deck?
  end

  def buy
    buy_card = Card.find(params[:card])
    if buy_card.cost.to_i > session[:credit]
      flash[:notice] = "not enough cash. buy cancelled"
    else
      session[:credit] -= buy_card.cost.to_i
      flash[:notice] = "bought card"
      session[:player_discard].push session[:buy_hand].delete(Card.find(params[:card]))
    end

    respond_to do |format|
      format.js
    end
  end

end
