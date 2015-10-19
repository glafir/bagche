class CreateFlashMessages < ActiveRecord::Migration
  def change
    create_table :flash_messages do |t|
      t.integer :user_id
      t.string :message

      t.timestamps null: false
    end
  end
end
