class GamesController < ApplicationController

  def new
    session[:ship] = Ship.new
    @event_results = User.new
    initialize_player(session[:ship].attributes)
    initialize_system
    redirect_to games_process_round_path
  end

  def play
    session[:location]="space"

    discard_cards
    draw_new_cards("player_deck", "player_discard", "player_hand", @player.crew)
    draw_new_cards("event_deck", "event_discard", "event_hand", @player.speed)

    tally_resources
    event_tally

    redirect_to games_process_round_path
  end

  def process_round
    @event_results = User.new
    if @player.hull < 1
      redirect_to games_game_end_path and return
    else
      render "play"
    end
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
    @cargo_card = Card.find(params[:card])
    if enemy_present?
      flash[:notice] = "Cannot safely loot cargo while enemies are present"
    else
      loot_cargo if @cargo_card.effect == "cargo"
    end

    respond_to do |format|
      format.js
    end
  end

  def jettison
    @cargo_card = Card.find(params[:card])
    @player.cargo -= @cargo_card.modifier.to_i
    flash[:notice] = "#{@cargo_card.flavor_text} was jettisoned"
    @player.cargo_bay.delete(@cargo_card)

    respond_to do |format|
      format.js
    end
  end


  def station
    if enemy_present? && session[:location] == "space"
      flash[:notice] = "Cannot dock at stations while enemy is present"
      redirect_to games_process_round_path
    else
      refresh_buy_deck?
      session[:location] = "station"
      if params[:service] == "repair"
        repair_ship
      else
        flash[:notice] = "Docked at outpost."
      end
    end
  end


  def sell
    @cargo_card = Card.find(params[:card])
    @player.credit += @cargo_card.cost.to_i
    @player.cargo -= @cargo_card.modifier.to_i
    flash[:notice] = "Sold #{@cargo_card.flavor_text} for #{@cargo_card.cost} credits."
    @player.cargo_bay.delete(@cargo_card)

    respond_to do |format|
      format.js
    end
  end


  def game_end
  end

end
