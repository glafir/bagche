class Order < ActiveRecord::Base
  has_many :comments, as: :item
  has_many :order_histories
  belongs_to :order_state
  belongs_to :manager, class_name: 'User', foreign_key: :manager_id
  belongs_to :user
  belongs_to :product

  after_initialize { puts "initialized" } # item.new item.find
  after_create { puts "created" } # item.create
  after_save { puts "saved" } # item.save item.create item.update_attributes
  after_destroy{ puts "deleted" } # item.destroy
end
