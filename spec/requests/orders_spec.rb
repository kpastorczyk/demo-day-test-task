require 'rails_helper'

RSpec.describe "/orders", type: :request do
  let(:valid_attributes) {
    attributes_for(:order)
  }

  let(:products_attributes) {
    {
      products: [
        attributes_for(:product, :mailer_box).except(:order_id),
        attributes_for(:product, :poly_mailer).except(:order_id),
      ]
    }
  }

  let(:invalid_attributes) {
    attributes_for(:order, sales_id: nil)
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Order.create! valid_attributes
      get orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      order = Order.create! valid_attributes
      get order_url(order), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post orders_url,
               params: { order: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Order, :count).by(1)
      end

      it "renders a JSON response with the new order" do
        post orders_url,
             params: { order: valid_attributes.merge(products_attributes) }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(JSON.parse(response.body).keys).to match_array(%w[id status products])
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order" do
        expect {
          post orders_url,
               params: { order: invalid_attributes }, as: :json
        }.to change(Order, :count).by(0)
      end

      it "renders a JSON response with errors for the new order" do
        post orders_url,
             params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        patch order_url(order),
              params: { order: invalid_attributes }, headers: valid_headers, as: :json
        order.reload
        skip("Add assertions for updated state")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the order" do
        order = Order.create! valid_attributes
        patch order_url(order),
              params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete order_url(order), headers: valid_headers, as: :json
      }.to change(Order, :count).by(-1)
    end
  end
end
