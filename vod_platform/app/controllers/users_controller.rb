class UsersController < ApplicationController
def create
  ls = UserService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end
end
