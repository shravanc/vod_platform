class EmptyReviewInterceptor < ReviewInterceptor

  def perform(context)	
    reviews = context.get_reviews
    if reviews.empty?
	    context.unsuccessful self
      return false
    else
	    context.successful self
      return true
    end
  end

end
