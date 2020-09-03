class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :type
      t.integer :quantity
      t.json :product_attributes
      t.integer :order_id

      t.timestamps
    end
  end
end
