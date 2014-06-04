 class GamesController < ApplicationController

# -------------------- System Related -----------------
  def new
    session[:ship] = Ship.new
    @event_results = User.new
    initialize_player(session[:ship].attributes)
    initialize_system
    round_housekeeping
    redirect_to games_process_round_path
  end


  def play
    round_housekeeping
    redirect_to games_process_round_path
  end


  def game_end
  end

# -------------------- Round Upkeep -----------------
  def process_round
    @event_results = User.new
    game_over?
    if session[:game_status] != "continue"
      redirect_to games_game_end_path and return
    else
      render "play"
    end
  end

# -------------------- Space Events -----------------
  def event
    @event_results = User.new
    @event_card = Card.find(params[:card])
    compute_attack if @event_card.card_type == "enemy" || @event_card.card_type == "boss"

    respond_to do |format|
      format.js
    end
  end


  def shield_up
    card = Card.find(params[:card])
    if @player.energy >= 1 && card.effect == "shield"
      charge_amount = card.modifier.to_i
      until charge_amount <= 0 || @player.shield >= session[:ship].max_shield do
         @player.energy -= 1
         charge_amount -= 1
         @player.shield += 1
      end
      flash[:notice] = "Shield capacitor now at #{@player.shield} units"
      session[:player_discard].push(card)
      session[:player_hand].delete(card)
    else
      flash[:notice] = "Not enough energy to charge shields"
    end

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

# -------------------- Station Activities -----------------
  def station
    if enemy_present? && session[:location] == "space"
      flash[:notice] = "Cannot dock at stations while enemy is present"
      redirect_to games_process_round_path
    else
      refresh_buy_deck if session[:location] == "space"
      @player.round += 1 if session[:location] == "space"
      session[:location] = "station"
      if params[:service] == "repair"
        repair_ship
      elsif params[:service] == "hire"
        hire_crew
      elsif params[:service] == "recharge"
        recharge_energy
      elsif params[:service] == "shield"
        recharge_shield
      else
        flash[:notice] = "Docked at outpost."
      end
    end
  end


  def buy
    @event_results = User.new
    @buy_card = Card.find(params[:card])
    if @buy_card.cost.to_i > @player.credit
      flash[:notice] = "not enough cash. buy cancelled"
    else
      @player.credit -= @buy_card.cost.to_i
      flash[:notice] = "bought card"
      if @buy_card.card_type != "ship_upgrade"
        session[:player_discard].push(session[:buy_hand].delete(Card.find(params[:card])))
      elsif @buy_card.card_type == "ship_upgrade"
        install_upgrade
        session[:buy_hand].delete(Card.find(params[:card]))
      end
    end

    respond_to do |format|
      format.js
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

end
