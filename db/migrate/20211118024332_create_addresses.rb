class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :address
      t.string :postal_code
      t.string :name
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
