class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand_id
      t.string :name
      t.string :artcode
      t.integer :quantity
      t.float :price
      t.string :description

      t.timestamps null: false
    end
  end
end
