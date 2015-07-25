require 'rails_helper'

RSpec.describe Cart, type: :model do
  # when you destroy the cart, the line items go with it
  it { should have_many(:line_items).dependent(:destroy) }
end

# dependent vs nullify
