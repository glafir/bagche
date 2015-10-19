class Brand < ActiveRecord::Base
mount_uploader :logotip, AvatarUploader
has_many :products
belongs_to :country
end
