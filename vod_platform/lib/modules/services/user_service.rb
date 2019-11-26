class UserService < MicroService
attr_accessor :host

def initialize request=nil, params=nil
  super
  @host = "http://" + self.subdomain + ":3003"
end

def call
    Rails.logger.warn "******#{self.access.path}*******"
  if self.access.path.include? "confirmation"
    Rails.logger.warn "******Confirmation*******"
    self.resp = self.send(self.access.method.downcase, "users/confirmation?token=#{self.data["token"]}")
  else
    Rails.logger.warn "******Confirmation*******"
    self.resp = self.send(self.access.method.downcase)
  end
end

def get_response
  return [ self.resp, :ok ]
end


end
