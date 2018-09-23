class Policy < ApplicationRecord
    belongs_to :users, class_name: 'User', foreign_key: 'user_id'
    belongs_to :agents, class_name: 'Agent', foreign_key: 'agent_id'
    belongs_to :insurance_category, class_name: 'InsuranceCategory', foreign_key: 'insurance_category_id'
    has_many :usernotifications, :as => :unotifable

    mount_uploader :policy, PolicyUploader

    validates :agent_id, :user_id, :insurance_category_id, :premium,:policy_id,:insurance_due_date,:register_date,:premium_date,:guarantee_number, presence: true
    validates :agent_id, :user_id, :insurance_category_id, :policy_id, format: { with: /\A[+-]?\d+\z/, message: "only allows numbers" }
    validates :policy_id, uniqueness: true, on: :create
end
