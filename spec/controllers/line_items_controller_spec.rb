require 'rails_helper'

describe LineItemsController do
  # anytime we reference :cart, go to this created cart
  let(:cart) { FactoryGirl.create(:cart) }
  let(:product) { FactoryGirl.create(:product) }
  let(:valid_attributes) { { product_id: product.id } }
  let(:valid_session) { {cart_id: cart.id} }

  describe "POST create" do
    describe "with valid params" do
      it "adds the LineItem to the cart" do
        # expect block to change to change the cart line item's count by one
        expect {
          # when posting to the create action
          post :create, valid_attributes, valid_session
          # change method is object calling on and method I wanna call
        }.to change(cart.line_items, :count).by(1)
      end

      it "redirects to the cart" do
        post :create, valid_attributes, valid_session
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to include("Product added to cart")
      end
    end

    describe "with invalid params" do
      it "raises an error" do
        # Trigger the behavior that occurs when invalid params are submitted
        # any instance should return false when I save, this is a STUB!!
        allow_any_instance_of(LineItem).to receive(:save).and_return(false)
        expect {
          post :create, {:product_id => 123456789 }, valid_session
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
