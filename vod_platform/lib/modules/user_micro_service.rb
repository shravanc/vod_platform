class UserMicroService < Services
  attr_accessor :request, :params
  

  def initialize req=nil, par=nil
    self.request = req
    self.params  = par
  end

  def service_instance
    UserService.new(self.request, self.params)
  end

end
