class SubscriptionInterceptor < ReviewInterceptor
  def perform(context)	
    supported_domains = context.get_allowed_subdomain
    subdomain = context.get_current_subdomain
    #subdomain = 'amazon' #request.subdomain
    if supported_domains.include?subdomain
	    context.successful self
      return true
    else
	    context.unsuccessful self
      return false
    end
  end	
end

