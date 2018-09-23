class Admin < ApplicationRecord
  has_secure_password
  has_many :promos
  has_many :comment_replies, :as => :commentable

  validates :name, length: { in: 2..255 }
  validates :username, uniqueness: true, length: { in: 3..255 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters / numbers" }
  validates :password, length: { minimum: 6  }
end
