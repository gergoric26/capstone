class Item < ActiveRecord::Base
  belongs_to :vendor
  has_many :order_items

  before_destroy :ensure_not_referenced_by_any_order_items


  has_attached_file :image, styles:  { thumb: "75x75>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  private

  def ensure_not_referenced_by_any_order_items
    if order_items.empty?
      return true
    else
      error.add(:base, 'Order Items present')
      return false
    end
  end
end
