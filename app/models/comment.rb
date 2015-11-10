class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, polymorphic: true

  validates :comment, :presence => true
  validates :user_id, :presence => true

  belongs_to :commentable, :polymorphic => true
  has_many   :comments, :as => :commentable,  :dependent => :destroy

  def after_create
    @message = comments_message(self)
    @message.update_attribute(:comments_counter, @message.comments_counter + 1)
  end

  def comments_message(comment)
    if comment.commentable_type  == "Message"
      return comment.commentable
    else
      return comments_message(comment.commentable)
    end
  end
end
