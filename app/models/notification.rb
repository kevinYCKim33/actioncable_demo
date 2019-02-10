class Notification < ApplicationRecord
  # a user is also the one causing the notification
  belongs_to :user
  # conversely... if i go kevin.notifications
  # it should know to look up the users that are on the receiving end of the notifications
  belongs_to :recipient, class_name: "User" # to look up the users table...
  # id column is recipient id...
  belongs_to :notifiable, polymorphic: true

  after_commit -> { NotificationRelayJob.perform_later(self) }
end
