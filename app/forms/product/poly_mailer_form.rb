class Product::PolyMailerForm < ::ProductForm
  validates :quantity, length: { minimum: 50, maximum: 2000 }
  validates :width, :height, length: { minimum: 1, maximum: 200 }
  validates_inclusion_of :material, in: ["black", "transparent"]
end