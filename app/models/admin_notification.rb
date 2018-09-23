class AdminNotification < ApplicationRecord
    belongs_to :anotifable, :polymorphic => true
    scope :unread, -> { where(:read_at => nil)}
end
