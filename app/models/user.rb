class User < ApplicationRecord
    has_secure_password
    enum gender: [ :male, :female]
    mount_uploader :avatar, AvatarUploader
    has_many :policies
    has_many :agents, through: :policies
    has_many :comments
    has_many :comment_replies, :as => :commentable
    has_many :request_changes

    validates :name, :phone_number, :email, :gender, :address, :birth_place, :birth_date, presence: true
    validates :name, length: { in: 2..255 }
    validates :phone_number, length: { in: 4..20 }, format: { with: /\A[+-]?\d+\z/, message: "only allows numbers" }
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :phone_number, uniqueness: true
    validates :address, length: { minimum: 3 }
    # validates :avatar,
    # validates :email, uniqueness: true, on: :create, format: { with: VALID_EMAIL_REGEX }
end
