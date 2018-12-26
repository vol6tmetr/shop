class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status, null: false, default: 'new'
      t.string :name, null: false, default: ''
      t.string :phone_number, null: false, default: ''
      t.string :address, null: false, default: ''
      t.float :price, null: false

      t.belongs_to :manager, index: true
      t.timestamps
    end
  end
end
