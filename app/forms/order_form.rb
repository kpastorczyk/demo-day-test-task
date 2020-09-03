class OrderForm < BaseFormObject
  validates :client_id, :sales_id, presence: true

  private

  def object_class
    ::Order
  end

  def permitted_attributes
    %i[client_id sales_id status]
  end
end