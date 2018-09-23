class UserNotification < ApplicationRecord
    belongs_to :unotifable, :polymorphic => true
    enum category: [:policy, :agent, :promo, :reply]
    scope :unread, -> { where(:read_at => nil)}
end
