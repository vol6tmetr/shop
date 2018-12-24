class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''

      t.belongs_to :store, index: true
      t.timestamps
    end
  end
end
