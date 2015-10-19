class UserTracing < ActiveRecord::Base
  paginates_per 30
  belongs_to :user
  attr_accessible :user_id, :sign_in_at, :sign_out_at, :ip_address
end
