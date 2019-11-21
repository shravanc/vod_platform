require "micro_service"


class TenantService < MicroService
attr_accessor :host

def initialize request=nil, params=nil
  @host = "http://localhost:3003"
  super
end

def call
  self.resp = self.send(self.access.method.downcase)
end

def get_response
  return [ self.resp, :ok ]
end


end
