class Cart < ActiveRecord::Base

has_many :ordered_items, dependent: :destroy

  def add_item(item_args)
    current_item = ordered_items.find_by(item_id: item_args[:item_id])

    if current_item
      current_item.quantity += item_args[:quantity].to_i
      current_item.save
    else
      current_item = ordered_items.build(item_args)
    end
      current_item
  end
end
