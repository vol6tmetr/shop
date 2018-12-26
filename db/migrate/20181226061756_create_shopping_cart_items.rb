class CreateShoppingCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_cart_items do |t|
      t.integer :product_variant_id
      t.integer :quantity

      t.belongs_to :shopping_cart, index: true
      t.timestamps
    end
  end
end
