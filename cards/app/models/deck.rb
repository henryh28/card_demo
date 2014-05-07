class Deck < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :cards, dependent: :destroy
end
