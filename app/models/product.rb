class Product < ApplicationRecord
  has_many_attached :image

  belongs_to :store
end
