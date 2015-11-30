class LineItemVendorOrder < ActiveRecord::Base
  belongs_to :line_item
  belongs_to :vendor_order
end
