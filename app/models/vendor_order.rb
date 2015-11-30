class VendorOrder < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :order

  has_many :line_item_vendor_orders
  has_many :line_items, through: :line_item_vendor_orders

  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
end
