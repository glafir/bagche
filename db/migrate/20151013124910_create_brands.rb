class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :namebrand
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
