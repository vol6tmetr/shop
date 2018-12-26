class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :cart_items
      t.string :items_quantity

      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
