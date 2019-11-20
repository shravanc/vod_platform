require 'admin_service'
class Admin::RolesController < ApplicationController

def index
  as = AdminService.new request, params
  as.call
  if as.valid?
    data, status = as.get_response
  else
    data, status = as.error_response
  end
  render json: data, status: status
end


def create
  as = AdminService.new request, params
  as.call
  if as.valid?
    data, status = as.get_response
  else
    data, status = as.error_response
  end
  render json: data, status: status
end


end
