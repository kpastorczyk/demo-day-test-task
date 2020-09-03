class CreateOrderWithProductsService
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def call
    ActiveRecord::Base.transaction do
      order = Order.new(params.except("products"))
      (params[:products] || []).each do |product|
        Product.new(product.merge!(product_attributes: nil, order: order)).save!
      end
      return order
    end
  end
end