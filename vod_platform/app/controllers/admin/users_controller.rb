class Admin::UsersController < ApplicationController

before_action :initialize_service

def create
  data, status = @service.communicate
  render json: data, status: status
end


private

def initialize_service
  @service = AdminMicroService.new(request, params)
end


end
