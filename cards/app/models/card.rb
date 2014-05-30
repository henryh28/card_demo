class Card < ActiveRecord::Base
  attr_accessible :card_type, :effect, :modifier, :flavor_text, :cost, :efficiency
  belongs_to :deck
end
