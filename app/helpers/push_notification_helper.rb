module PushNotificationHelper
  def push_notification device_token, title, body
    require 'andpush'

    server_key   = "AAAAGKdAA7I:APA91bGuJOxOTf9z6rB-ArgZk2OJGMMTYmbWxME9dXlSywDy7f537nKx9wB-hxLIw1boooPOg4iBhlvXmMoc6iTMdfNt7Hjfg23U72EI9i6zcHl_O-YUg52jmJQBd3HGZjvuuvGO0SgH" # Your server key
    # The device token of the device you'd like to push a message to

    client  = Andpush.new(server_key, pool_size: 25)
    payload = {
      to: device_token,
      notification: {
        title: title,
        body: body
      },
      data: { extra: "data" }
    }

    client.push(payload)
  end

end
