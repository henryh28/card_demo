class Deck < ActiveRecord::Base
  attr_accessible :name, :deck_type
  has_many :cards, dependent: :destroy
end
