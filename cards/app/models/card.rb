class Card < ActiveRecord::Base
  attr_accessible :type, :effect, :modifier
  belongs_to :deck
end
