class Deck < ActiveRecord::Base
  attr_accessible :name, :deck_type
  has_many :cards, dependent: :destroy

  validates :name, presence: true
  validates :deck_type, presence: true
end
