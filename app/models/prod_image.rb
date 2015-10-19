class ProdImage < ActiveRecord::Base
  mount_uploader :prodimage, AvatarUploader
  belongs_to :product
end
