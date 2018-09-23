class RequestChange < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :agent, class_name: 'Agent', foreign_key: 'agent_id'
  has_many :adminnotifications, :as => :anotifable

  validates :reason, presence: true
  validates :reason, length: { minimum: 3 }
end
