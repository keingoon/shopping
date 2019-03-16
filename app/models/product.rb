class Product < ApplicationRecord
  belongs_to :company
  validates :name, presence: true, length: {maximum: 50}
end
