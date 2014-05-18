module ApplicationHelper

  def tally_resources
    session[:player_hand].each do |card|
      if card.card_type == "resource" || card.card_type == "equipment"
        @round_stats[card.effect] += card.modifier.to_i
        session[:"#{card.effect}"] += card.modifier.to_i
        session[:"#{card.effect}"] = 10 if session[:"#{card.effect}"] > 10 && card.effect != "credit"
      end
    end
  end

  def check_game_over?
    session[:hull] < 1
  end

end
