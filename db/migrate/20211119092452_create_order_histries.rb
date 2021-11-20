class CreateOrderHistries < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histries do |t|
      t.integer :item_id, :null =>false
      t.integer :order_id, :null =>false
      t.integer :price, :null =>false
      t.integer :quantity, :null =>false
      t.integer :production_status, :null =>false
      
      t.timestamps
    end
  end
end
