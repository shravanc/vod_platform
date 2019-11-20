require "list_service"
class ListsController < ApplicationController
#include Requests

def index
  Rails.logger.warn "===="
  Rails.logger.warn request.method
  ls = ListService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.success_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end

def index1
  url = "http://localhost:3001/lists"
  data = get({url: url})  
  render json: data, status: :ok
end

end
