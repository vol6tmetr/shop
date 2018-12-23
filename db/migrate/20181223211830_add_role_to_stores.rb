class AddRoleToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :role, :string, default: 'store'
  end
end
