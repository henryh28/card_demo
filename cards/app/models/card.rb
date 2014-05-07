class Card < ActiveRecord::Base
  attr_accessible :card_type, :effect, :modifier
  belongs_to :deck
end
