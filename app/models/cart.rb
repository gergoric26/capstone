class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_item(item_id, quantity)
    current_item = line_items.find_or_create_by(item_id: item_id)

    current_item.update(quantity: quantity)

    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
