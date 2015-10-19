class OrderHistory < ActiveRecord::Base
include ActiveModel::Validations
paginates_per 25
belongs_to :order
belongs_to :user
end
