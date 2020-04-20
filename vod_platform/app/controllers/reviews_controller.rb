class ReviewsController < ApplicationController

before_action :intercept
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
def intercept
  Rails.logger.warn("---1---")
  rs = SubscriptionContext.new(params, request)
  notify_subscription_dispatcher(rs)
end

def initialize_service
  Rails.logger.warn("---2---")
  @service = ReviewMicroService.instance
  @service.attributes(request, params)
end

end
