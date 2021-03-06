class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart
  belongs_to :order
  has_many :line_item_vendor_orders
  has_many :line_items, through: :line_item_vendor_orders


  def total_price
    item.price * quantity
  end
end
