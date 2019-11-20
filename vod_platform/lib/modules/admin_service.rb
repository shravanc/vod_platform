require "micro_service"


class AdminService < MicroService
attr_accessor :host

def initialize request, params
  @host = "http://localhost:3001"
  super
end

def call
  self.resp = self.send(self.access.method.downcase)
end

def get_response
  return [ self.resp, :ok ]
end


end
