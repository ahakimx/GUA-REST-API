class V1::User::PushNotificationsController < ApplicationController
  include PushNotificationHelper

  def send_push
    push_notification("d5d9T2m6ahM:APA91bFPugTXBAF_CAlswefVugC2300FFlBVRrXk3BfW3f_vleAleqxbSjFCzAjdY2I3NPvcA2ErPaXQYgYV0kNVutWNAmMIJNR_TWzJca7jCAU4tDL1zguKzXqZ05GM0Cevz_xV9XeS", "hello", "Yeay")
    render json: {message: "Push Sended"}, status: :ok
  end

end
