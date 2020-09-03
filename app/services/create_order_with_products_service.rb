class CreateOrderWithProductsService
  attr_accessor :params, :order

  def initialize(params)
    @params = params
  end

  def call
    @order_form = OrderForm.new(params.except("products"))
    @products = (params[:products] || []).map do |product|
      "#{product["type"]}Form".classify.constantize.new(product)
    end
    result_for(order.errors) if !@order_form.valid?

    ActiveRecord::Base.transaction do
      @order = @order_form.save
      @products.each{ |product| product.save }
      return OpenStruct.new(success?: true, order: @order, errors: @order.errors)
    end
  rescue => error
    result_for(error)
  end

  private

  def result_for(error)
    OpenStruct.new(success?: false, order: nil, errors: error)
  end
end