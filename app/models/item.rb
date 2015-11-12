class Item < ActiveRecord::Base
  belongs_to :vendor


  has_attached_file :image, styles:  { thumb: "75x75>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
