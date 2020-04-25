class AuthenticationContext < AccessContext

  def initialize(params, request)
    @reviews = params[:review] #params.require(:review).permit([:text])
    @allowed_subdomains = ['amazon', 'hbo']
    @request = request
  end

  def get_auth_token
   return @allowed_subdomains
  end

  def get_current_subdomain
    @request.subdomains[0]
  end

  def get_session
   return @reviews[:text]
  end

  def successful interceptor
    Rails.logger.info("Subscription Interceptor successful--->#{interceptor.class}")
  end

  def unsuccessful interceptor
    Rails.logger.info("Subscription Interceptor unsuccessful--->#{interceptor.class}")
    #render json: {'message': 'Subscription not found for the service'}
    return
  end

end
