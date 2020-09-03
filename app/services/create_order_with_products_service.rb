class CreateOrderWithProductsService
  attr_accessor :params, :order

  def initialize(params)
    @params = params
  end

  def call
    @order = Order.new(params.except("products"))
    result_for(order.errors) if !order.valid?

    ActiveRecord::Base.transaction do
      (params[:products] || []).each do |product|
        order.save!
        Product.new(product.merge!(order: order)).save!
      end
      return OpenStruct.new(success?: true, order: order, errors: order.errors)
    end
  rescue => error
    result_for(error)
  end

  private

  def result_for(error)
    OpenStruct.new(success?: false, order: nil, errors: error)
  end
end