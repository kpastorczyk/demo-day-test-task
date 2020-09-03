class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :products

  def products
    object.products.map do |product|
      ::ProductSerializer.new(product).attributes
    end
  end
end
