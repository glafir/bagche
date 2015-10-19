class UserTheme < ActiveRecord::Base
include ActiveModel::Validations
  has_many :user
  attr_accessible :theme
end
