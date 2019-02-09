class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "notifcations:1" # all notifs for that user with id 1
    stream_from "notifcations:#{current_user.id}" # all notifs for that user with id 1
    # each time pull those out... each user will receive these notifications
  end

  def unsubscribed
    stop_all_streams # when you unsubscribe
    # Any cleanup needed when channel is unsubscribed
  end
end
