# rails g job NotificationRelay
class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # Do something later
    html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
    # ApplicationController.render partial: "notifications/users/followed", notification: notification, formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", html: html
    # goes directly to notification.js's received: function(data) listener where data.html is the partial
  end
end


# rails c

# Notification.create(recipient: User.first, user: User.last, action: "followed", notifiable: User.first)
# notification = Notification.last
# NotificationRelayJob.perform_later(notification)
