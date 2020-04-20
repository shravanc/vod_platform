class ReviewContext

  def initilize(params=nil)
    Rails.logger.warn('****ReviewContext****')

    @allowed_subdomain = ['aws', 'hbo']
  end

  def get_allowed_subdomain
  end

  def get_reviews
  end

  def succesul
  end

  def unsuccesful
  end


end
