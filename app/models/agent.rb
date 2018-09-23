class Agent < ApplicationRecord
    enum gender: [:male, :female]
    has_many :policies
    has_many :users, through: :policies
    has_many :comments
    has_many :request_changes

    mount_uploader :avatar, AvatarUploader

    validates :name, :phone_number, :email, :address, :gender, :birth_place, :birth_date, presence: true
    validates :name, length: { in: 1..255 }
    validates :phone_number, length: { in: 4..20 }, format: { with: /\A[+-]?\d+\z/, message: "only allows numbers" }
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :phone_number, uniqueness: true
    validates :address, length: { minimum: 3 }
    # validates :avatar,
    # validates :email, uniqueness: true, on: :create, format: { with: VALID_EMAIL_REGEX }
    validates :change_request_count, allow_blank: true, format: { with: /\A[+-]?\d+\z/, message: "only allows numbers" }
end
