class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :agent, class_name: 'Agent', foreign_key: 'agent_id'
  belongs_to :subject_comment, class_name: 'SubjectComment', foreign_key: 'subject_comment_id'
  has_many :comment_replies
  has_many :adminnotifications, :as => :anotifable

  validates :subject_comment_id, :agent_id, :user_id, :content, :rating, presence: true
  validates :rating,  :numericality => { :only_integer => true }
  validates :content, length: { minimum: 3 }
end
