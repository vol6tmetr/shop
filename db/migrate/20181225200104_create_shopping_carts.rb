class CreateShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_carts do |t|
      t.belongs_to :customer, index: true
      t.float :price, default: 0

      t.timestamps
    end
  end
end
