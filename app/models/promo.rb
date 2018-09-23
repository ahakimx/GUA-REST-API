class Promo < ApplicationRecord
  belongs_to :admin
  has_many :usernotifications, :as => :unotifable
  mount_uploader :image, ImageUploader
  validates :title, :content, :due_date,  presence: true
  validates :title, length: { minimum: 3 }
end
