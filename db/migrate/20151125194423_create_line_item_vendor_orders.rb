class CreateLineItemVendorOrders < ActiveRecord::Migration
  def change
    create_table :line_item_vendor_orders do |t|
      t.references :line_item, index: true, foreign_key: true
      t.references :vendor_order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
