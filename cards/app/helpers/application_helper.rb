module ApplicationHelper

  def tally_resources
    @player_hand.each do |card|
      if card.card_type == "resource"
        @round_stats[card.effect] += card.modifier.to_i
      end
    end
  end

end
