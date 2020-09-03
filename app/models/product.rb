class Product < ApplicationRecord
  belongs_to :order

  def width
    product_attributes["width"]
  end

  def height
    product_attributes["height"]
  end

  def price
    raise NotImplementedError, "subclass did not define #price"
  end
end
