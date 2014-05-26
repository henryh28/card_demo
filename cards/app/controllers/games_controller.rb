class GamesController < ApplicationController

  def new
    session[:ship] = Ship.new
    @event_results = User.new
    initialize_player(session[:ship].attributes)
    initialize_system
    render "play"
  end

  def play
    session[:location]="space"
    @event_results = User.new
    round_housekeeping
    redirect_to games_game_end_path if @player.hull < 1

    player_hand_size = 5
    event_hand_size = 3

    discard_cards
    draw_new_cards("player_deck", "player_discard", "player_hand", player_hand_size)
    draw_new_cards("event_deck", "event_discard", "event_hand", event_hand_size)
    refresh_buy_deck?
  end

  def buy
    @event_results = User.new
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
    @event_results = User.new
    @event_card = Card.find(params[:card])
    compute_attack if @event_card.card_type == "enemy"

    respond_to do |format|
      format.js
    end
  end


  def cargo
    @event_results = User.new
    @event_card = Card.find(params[:card])
    loot_cargo if @event_card.effect == "cargo"

    respond_to do |format|
      format.js
    end
  end

  def jettison
    @event_card = Card.find(params[:card])
    @player.cargo -= @event_card.modifier.to_i
    flash[:notice] = "#{@event_card.flavor_text} was jettisoned"
    @player.cargo_bay.delete(@event_card)

    respond_to do |format|
      format.js
    end
  end


  def station
    if params[:service] == "repair"
      repair_ship
    else
      flash[:notice] = "Docked at outpost."
    end
  end


  def game_end
  end

end
