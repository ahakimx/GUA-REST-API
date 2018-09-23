class NotifUserPromoJob < ApplicationJob
  queue_as :default

  def perform(promo, current_admin)
    users = ::User.all
    users.each do |user|
      UserNotification.create(recipient_id: user.id, actor_id: current_admin.id, action: "posted", unotifable: promo, category: 2, title:"Promo Terbaru!", content: promo.title)
    end
  end
end
