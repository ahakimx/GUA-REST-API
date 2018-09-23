class PushnotifUserPromoJob < ApplicationJob
  queue_as :default
  include PushNotificationHelper
  def perform(promo)
    users = ::User.where.not(fcm_token: [nil, ""])
    users.each do |user|
      push_notification(user.fcm_token, promo.title, promo.content)
    end
  end
end
