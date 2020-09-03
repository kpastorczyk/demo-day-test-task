class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :sales_id
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
