FactoryBot.define do
  factory :product do
    type { "" }
    quantity { 1 }
    product_attributes do
      {
        width: 10,
        height: 10,
        length: 10
      }
    end
    order_id { 1 }
  end
end
