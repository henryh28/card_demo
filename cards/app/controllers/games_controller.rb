class GamesController < ApplicationController

  def new
    initialize_variables
    render "play"
  end

  def play
    round_housekeeping
    redirect_to games_game_end_path if session[:hull] < 1

    player_hand_size = 5
    event_hand_size = 3

    discard_cards
    draw_new_cards("player_deck", "player_discard", "player_hand", player_hand_size)
    draw_new_cards("event_deck", "event_discard", "event_hand", event_hand_size)
    @round_stats = Round.new
    @event_round = Round.new
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


  def event
    p "$$$$$$$$$$"
    p @event_card = Card.find(params[:card])
    compute_attack if @event_card.card_type == "enemy"

    session[:notice] = "test test test"

    respond_to do |format|
      format.js
    end
  end


  def game_end
  end

end
