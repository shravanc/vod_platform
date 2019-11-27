class Admin::ListsController < ApplicationController
before_action :initialize_service

def index
  data, status = @service.communicate
  render json: data, status: status
end

def show
  data, status = @service.communicate
  render json: data, status: status
end

def create
  data, status = @service.communicate({authorize: true})
  render json: data, status: status
end

def update
  data, status = @service.communicate({authorize: true})
  render json: data, status: status
end

def destroy
  data, status = @service.communicate({authorize: true})
  render json: data, status: status
end

private

def initialize_service
  @service = ListMicroService.instance
  @service.attributes(request, params)
end



end
