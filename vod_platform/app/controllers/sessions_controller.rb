class SessionsController < ApplicationController

def create
  as = UserService.new request, params
  as.call
  if as.valid?
    data, status = as.get_response
  else
    data, status = as.error_response
  end
  render json: data, status: status
end 

end
