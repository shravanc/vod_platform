module Requests

def get params={}
  url = params[:url]
  response = HTTParty.get(url).to_json
  return JSON.parse(response)
end

def post params={}

end

def put params={}

end

def destroy params={}

end


end
