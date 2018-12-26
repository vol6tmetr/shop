class ShoppingCart < ApplicationRecord
  belongs_to :customer
  has_many :shopping_cart_item, dependent: :destroy
end
