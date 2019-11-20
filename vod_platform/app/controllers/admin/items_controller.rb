require "item_service"

class Admin::ItemsController < ApplicationController

def index
  ls = ItemService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end

def create
  ls = ItemService.new(request, params)
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
  ls = ItemService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end

def destroy
  ls = ItemService.new(request, params)
  ls.call
  if ls.valid?
    data, status = ls.get_response
  else
    data, status = ls.error_response
  end
  render json: data, status: status
end

end
