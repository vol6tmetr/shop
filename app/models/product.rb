class Product < ApplicationRecord
  has_many_attached :image
  has_many :product_variant

  accepts_nested_attributes_for :product_variant, allow_destroy: true

  belongs_to :store
end
