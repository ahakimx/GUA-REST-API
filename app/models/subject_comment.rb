class SubjectComment < ApplicationRecord
  has_many :comments
  validates :name,  presence: true
  validates :name, length: { minimum: 3 }
end
