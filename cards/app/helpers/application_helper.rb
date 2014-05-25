module ApplicationHelper

  def tally_resources
    session[:player_hand].each do |card|
      @player[:"#{card.effect}"] += card.modifier.to_i
      @player[:"#{card.effect}"] = 10 if @player[:"#{card.effect}"] > 10 && card.effect != "credit"
    end
  end


  def event_tally
    session[:event_hand].each do |card|
      if card.effect == "energy" || card.effect == "credit"
        @player[:"#{card.effect}"] += card.modifier.to_i
        @player[:"#{card.effect}"] = 0 if @player[:"#{card.effect}"] < 1 && card.effect != "credit"
      end
    end
  end

end
