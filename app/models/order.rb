class Order < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_line_items_form_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
