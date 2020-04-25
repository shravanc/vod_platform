class AccessContext

  def initilize(params=nil)
    Rails.logger.warn('****ReviewContext****')

    @allowed_subdomain = ['aws', 'hbo']
  end

  def get_auth_token
  end

  def get_session
  end

  def succesul
  end

  def unsuccesful
  end

end
