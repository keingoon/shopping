class CartItem < ApplicationRecord
  validates :cart_id, presence: true
  validates :product_id, presence: true
  belongs_to :product
  belongs_to :cart
end
