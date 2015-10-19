class CreateProdImages < ActiveRecord::Migration
  def change
    create_table :prod_images do |t|
      t.string :prodimage
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
