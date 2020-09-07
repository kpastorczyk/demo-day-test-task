class GetOrdersQueryService
  def initialize(order_repository = Order)
    @order_repository = order_repository
  end

  def for_admin
    order_repository.all
  end

  def for(user)
    order_repository.where(client_id: user.id)
  end

  private
  attr_reader :order_repository
end