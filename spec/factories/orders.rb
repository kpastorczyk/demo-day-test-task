FactoryBot.define do
  factory :order do
    client_id { 1 }
    sales_id { 1 }
    status { 1 }
    product
  end
end
