class CommentReply < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
  has_many :usernotifications, :as => :unotifable

  validates :content, presence: true
  validates :content, length: { minimum: 3 }
end
