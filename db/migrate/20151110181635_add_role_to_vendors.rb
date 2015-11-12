class AddRoleToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :role, :integer
  end
end
