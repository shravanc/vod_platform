class UserService


def initialize request, params
  @request = request
  @data = nil
  @response = nil
end

def call
end

def get_response
end

def error_response
end

def get params={}
  url = params[i:url]
  url = "http://localhost:3001/lists"
  return HTTParty.get(url).to_json
end

def post params={}

end

def put params={}

end

def destroy params={}

end

end
