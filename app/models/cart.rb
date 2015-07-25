class Cart < ActiveRecord::Base
  # When a cart is deleted, it should destroy all associated line_items as well
  has_many :line_items, dependent: :destroy
end
