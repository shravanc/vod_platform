class ListsController < ApplicationController
include Requests

def index
  url = "http://localhost:3001/lists"
  data = get({url: url})  
  render json: data, status: :ok
end

end
