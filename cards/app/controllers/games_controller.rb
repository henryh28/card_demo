class GamesController < ApplicationController

  def new
    session[:ship] = Ship.new
    initialize_player(session[:ship].attributes)
    initialize_system
    render "play"
  end

  def play
    @player = session[:player]
    round_housekeeping
    redirect_to games_game_end_path if @player.hull < 1

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
    @player = session[:player]
    buy_card = Card.find(params[:card])
    if buy_card.cost.to_i > @player.credit
      flash[:notice] = "not enough cash. buy cancelled"
    else
      @player.credit -= buy_card.cost.to_i
      flash[:notice] = "bought card"
      session[:player_discard].push session[:buy_hand].delete(Card.find(params[:card]))
    end

    respond_to do |format|
      format.js
    end
  end


  def event
    @player = session[:player]
    @event_round = Round.new
    @event_card = Card.find(params[:card])
    compute_attack if @event_card.card_type == "enemy"

    respond_to do |format|
      format.js
    end
  end


  def game_end
  end

end
