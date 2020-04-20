class RecommendationsController < ApplicationController

before_action :intercept
before_action :initialize_service

def index
  data, status = @service.communicate
  render json: data, status: status
end


private
def intercept
  Rails.logger.warn("---1---")
  rs = RecommendationServiceContext.new(params)
end

def initialize_service
  Rails.logger.warn("---2---")
  @service = RecommendationMicroService.instance
  @service.attributes(request, params)
end
end
