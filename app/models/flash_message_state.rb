class FlashMessageState < ActiveRecord::Base
  attr_accessible :state
  belongs_to :flash_message
end
