require 'media_service'
class Admin::MediaController < ApplicationController

def index
  ls = ListService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end


def create
  ls = ListService.new(request, params)
  resp = ls.authorized?
  if resp.code != 200
    render json: {message: "User not autorized"}, status: :unprocessable_entity
    return
  end
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end


def update
  ls = ListService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end


end
