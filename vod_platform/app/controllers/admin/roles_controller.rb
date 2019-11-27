class Admin::RolesController < ApplicationController
before_action :initialize_service


def index
  data, status = @service.communicate
  render json: data, status: status
end

def create
  data, status = @service.communicate
  render json: data, status: status
end

private

def initialize_service
  @service = AdminMicroService.instance
  @service.attributes(request, params)
end

end
