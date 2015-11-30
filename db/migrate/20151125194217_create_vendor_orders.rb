class CreateVendorOrders < ActiveRecord::Migration
  def change
    create_table :vendor_orders do |t|
      t.references :vendor, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
