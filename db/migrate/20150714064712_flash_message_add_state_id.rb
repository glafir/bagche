class FlashMessageAddStateId < ActiveRecord::Migration
  def change
    add_column :flash_messages, :flash_message_state_id, :integer
  end
end
