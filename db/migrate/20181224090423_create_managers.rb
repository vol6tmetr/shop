class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :role, default: 'manager'

      t.timestamps
    end
  end
end
