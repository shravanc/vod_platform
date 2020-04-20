class ReviewService < MicroService
attr_accessor :host

def initialize request=nil, params=nil
  super
  @host = "http://" + self.subdomain + ":5000"
  Rails.logger.warn @host
end

def authorized?
  review_host = "http://" + self.subdomain + ":5001"
  url = review_host + "/predict"
  #url = admin_host + "/sessions/" + self.data["session_id"] + "/authorize?authorize_action=#{self.data["action"]}" + "_" + self.controller
  return HTTParty.get(url, construct_header)
end

def call
  self.resp = self.send(self.access.method.downcase)
end

def get_response
  [ self.resp, :ok ]
end


end
