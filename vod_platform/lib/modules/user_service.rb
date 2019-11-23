require "micro_service"


class UserService < MicroService
attr_accessor :host

def initialize request=nil, params=nil
  super
  @host = "http://" + self.subdomain + ":3003"
end

def call
  self.resp = self.send(self.access.method.downcase)
end

def get_response
  return [ self.resp, :ok ]
end


end
