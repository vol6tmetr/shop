class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.string :title, null: false, default: ''
      t.decimal :price, null: false

      t.belongs_to :product, index: true
      t.belongs_to :shopping_cart, index: true
      t.timestamps
    end
  end
end
