module ApplicationHelper

  def tally_resources
    session[:player_hand].each do |card|
      if card.card_type == "resource" || card.card_type == "equipment"
        @round_stats[card.effect] += card.modifier.to_i
        @player[:"#{card.effect}"] += card.modifier.to_i
        p "????????????????????"
        puts "card generates: #{card.effect} by #{card.modifier}"
        @player[:"#{card.effect}"] = 10 if @player[:"#{card.effect}"] > 10 && card.effect != "credit"
      elsif card.card_type == "combat"
        @round_stats["attack"] += card.modifier.to_i
      end
    end
  end


  def event_tally
    session[:event_hand].each do |card|
      if card.effect == "energy" || card.effect == "credit"
        @event_round[card.effect] += card.modifier.to_i
      elsif card.effect == "hull"
        @event_round["attack"] += card.modifier.to_i.abs
      end
    end
  end

end
