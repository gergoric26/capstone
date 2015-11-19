class Item < ActiveRecord::Base
  belongs_to :vendor
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_items


  has_attached_file :image, styles:  { thumb: "75x75>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  private

  def ensure_not_referenced_by_any_line_items
    if line_items.empty?
      return true
    else
      error.add(:base, 'Line Items present')
      return false
    end
  end
end
