class MicroService
attr_accessor :access, :data, :resp, :method, :path, :controller, :body_key, :url

def initialize request, params
  @access     = request
  @data       = params.as_json
  @resp       = nil
  @method     = request.method
  @path       = request.path.gsub("/admin", "")
  @controller = self.data["controller"].gsub("admin/", "")
  @body_key   = self.controller.singularize
  @url        = self.access.path.gsub("/admin", "")
  @privilege  = self.method + "_" + self.data["action"]
end

def call
end

def get_response
end

def error_response
  return [ {message: "Request Failed, Please contact Admin"}, :unprocessable_entity]
end

def get
  url = construct_url + "/" + (self.data["id"] || "")
  return HTTParty.get(url, :headers => construct_header).to_json
end

def post
  return HTTParty.post(construct_url, :headers => construct_header, :body => construct_body.to_json)
end

def put
  url = construct_url + "/" + (self.data["id"] || "")
  return HTTParty.put(url, :headers => construct_header, :body => construct_body.to_json)
end

def destroy

end

def valid?
  true
end

private


def construct_url
  return self.host + "/" + self.controller
end

def construct_body
  return { self.body_key => self.data[self.body_key] }
end

def construct_header
  return {'Content-Type'=>'application/json', 'Accept' => 'application/json'}
end

end

