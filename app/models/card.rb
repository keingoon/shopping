class Card < ApplicationRecord
  validates :token, presence: true
  has_many :users, through: :user_cards
end
