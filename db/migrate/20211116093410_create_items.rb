class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, :null =>false
      t.string :image_id, :null =>false
      t.integer :genre_id, :null =>false
      t.text :explanation, :null =>false
      t.integer :price, :null =>false
      t.boolean :sold_out, :null =>false, default: true


      t.timestamps
    end
  end
end
