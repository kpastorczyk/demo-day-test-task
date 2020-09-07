FactoryBot.define do
  factory :user do
    email { |n| "email_#{n}@bona.pl" }
    password { "qwerty13" }
  end
end
