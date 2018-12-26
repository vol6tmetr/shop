class Order < ApplicationRecord
  belongs_to :manager, optional: true
  has_many :order_items
end
