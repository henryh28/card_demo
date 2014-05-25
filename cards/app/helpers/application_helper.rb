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
        # @event_results[:"#{card.effect}"] += card.modifier.to_i
        @player[:"#{card.effect}"] += card.modifier.to_i
        @player[:"#{card.effect}"] = 0 if @player[:"#{card.effect}"] < 1 && card.effect != "credit"
      elsif card.effect == "hull"
        # @event_results.attack += card.modifier.to_i.abs
      end
    end
  end

end
