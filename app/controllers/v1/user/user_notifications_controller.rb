class V1::User::UserNotificationsController < UsersApplicationController
    before_action :authenticate_user_request
    attr_reader :current_user

    def index
        usernotifications = UserNotification.where(recipient_id: current_user.id).unread
        render json: usernotifications
    end

    def mark_as_read
        usernotifications = UserNotification.where(recipient_id: current_user.id).unread
        if usernotifications.update(read_at: Time.zone.now)
            render json: { message: "sucess" }, status: :ok
        else
            render json: { message: "failed"}, status: 422
        end
    end

end
