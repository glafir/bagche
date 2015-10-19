class Order < ActiveRecord::Base
  has_many :comments
  has_many :order_histories
  belongs_to :order_state
  belongs_to :manager, class_name: 'User', foreign_key: :manager_id

  belongs_to :user
  belongs_to :product
end
