class User < ActiveRecord::Base
  attr_accessible :name, :type, :cards_remaining

  has_many :cards, dependent: :destroy

  validates :name, presence: true
end
