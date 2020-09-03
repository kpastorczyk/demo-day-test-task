class Product::PolyMailer < ::Product
  def price
    (width + height) * material_weight * quantity
  end

  def material
    product_attributes["material"].to_sym
  end

  def material_weight
    0.25 if material == :transparent
    0.1
  end
end