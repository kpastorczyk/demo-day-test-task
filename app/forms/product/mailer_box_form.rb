class Product::MailerBoxForm < ::ProductForm
  validates :quantity, length: { minimum: 200, maximum: 1000 }
  validates :width, :height, :length, length: { minimum: 1, maximum: 200 }
end