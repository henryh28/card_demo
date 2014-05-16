class Card < ActiveRecord::Base
  attr_accessible :card_type, :effect, :modifier, :flavor_text, :cost
  belongs_to :deck
end
