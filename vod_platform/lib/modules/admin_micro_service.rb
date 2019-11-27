class AdminMicroService < Services
  attr_accessor :request, :params

  @instance = new
  private_class_method :new
  def self.instance
    @instance
  end

  def attributes req=nil, par=nil
    self.request = req
    self.params  = par
  end

  def service_instance
    AdminService.new(self.request, self.params)
  end

end
