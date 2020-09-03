class ProductForm < BaseFormObject
  validates :quantity, :width, :height, :length, :material, :type, :product_attributes, presence: true

  private

  def object_class
    ::Product
  end

  def permitted_attributes
    %i[quantity width height length material type product_attributes order]
  end
end