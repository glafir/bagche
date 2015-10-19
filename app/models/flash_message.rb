class FlashMessage < ActiveRecord::Base
  paginates_per 30
  belongs_to :user
  has_many :flash_message_states
end
