class LineItem < ActiveRecord::Base
  # makes a product
  belongs_to :product
  belongs_to :cart
end
