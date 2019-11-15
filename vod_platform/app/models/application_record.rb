class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



def create_auth_token
  self.auth_token = SecureRandom.alphanumeric(16)
end

def send_notification
  logger.debug "Notification sent"
end
end
