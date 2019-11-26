class UsersController < ApplicationController
before_action :initialize_service

def create
  data, status = @service.communicate({authorize: true})
  render json: data, status: status
end

def confirmation
  data, status = @service.communicate({authorize: true})
  render json: data, status: status
end

private

def initialize_service
  @service = ListMicroService.new(request, params)
end

end
