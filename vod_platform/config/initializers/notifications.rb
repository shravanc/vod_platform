ActiveSupport::Notifications.subscribe do |name, start, finish, id, payload|
  Rails.logger.warn payload[:db_runtime]
end
