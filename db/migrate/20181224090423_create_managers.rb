class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :role, default: 'manager'

      t.belongs_to :store, index: true

      t.timestamps
    end
  end
end
