class ApplicationController < ActionController::Base
end

#ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}, locals: {notification: notification}, formats: [:html]"

## above turns into for example...
# ApplicationController.render partial: "notifications/users/followed", notification: notification, formats: [:html]
