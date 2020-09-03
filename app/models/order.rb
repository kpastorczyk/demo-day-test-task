class Order < ApplicationRecord
  validates_presence_of :client_id, :sales_id

  has_many :products
end
