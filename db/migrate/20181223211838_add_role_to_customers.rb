class AddRoleToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :role, :string, default: 'customer'
  end
end
