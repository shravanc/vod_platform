class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



def create_authtoken
  self.authtoken = SecureRandom.alphanumeric(16)
end

def send_notification
  logger.debug "Notification sent"
end
end
