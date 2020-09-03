FactoryBot.define do
  factory :product do
    type { "" }
    quantity { 1 }
    order
  end

  trait :mailer_box do
    type { "Product::MailerBox" }
    product_attributes do
      {
        width: 10,
        height: 10,
        length: 10
      }
    end
  end

  trait :poly_mailer do
    type { "Product::PolyMailer" }
    product_attributes do
      {
        width: 10,
        height: 10,
        material: "transparent"
      }
    end
  end
end
