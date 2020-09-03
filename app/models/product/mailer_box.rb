class Product::MailerBox < ::Product
  def length
    product_attributes["length"]
  end

  def price
    (width + height + length) * 0.1 * quantity
  end
end