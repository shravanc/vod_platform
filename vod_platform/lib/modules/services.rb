class Services
  attr_accessor :request, :params

  def initialize(req=nil, parameters=nil)
    self.request = req
    self.params  = parameters
  end

  def service_instance
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def communicate options={}
    service = service_instance

    if options[:authorize]
      if (service.authorized?).code != 200
        return {message: "User not authorized"}, :unprocessable_entity
      end
    end

    service.call
    if service.valid?
      return service.get_response
    else
      return service.error_response
    end
  end

end
