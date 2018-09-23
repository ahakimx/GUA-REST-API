class V1::AdminNotificationsController < AdminsApplicationController
    before_action :authenticate_admin_request
    attr_reader :current_admin

    def index
        adminnotifications = AdminNotification.where(recipient_id: current_admin.id).unread
        render json: adminnotifications
    end

    def mark_as_read
        adminnotifications = AdminNotification.where(recipient_id: current_admin.id).unread
        adminnotifications.update(read_at: Time.zone.now) ? (render json: { message: "succes" }, status: :ok) : (render json: { message: "failed"}, status: 422)
    end
end
