class CreateFlashMessageStates < ActiveRecord::Migration
  def change
    create_table :flash_message_states do |t|
      t.string :state

      t.timestamps null: false
    end
  end
end
