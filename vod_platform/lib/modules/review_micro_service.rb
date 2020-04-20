class ReviewMicroService < Services
  attr_accessor :request, :params
  
  @instance = new
  private_class_method :new
  def self.instance
    @instance
  end

  def attributes req=nil, par=ni
    self.request = req
    self.params  = par
  end

  def service_instance
    ReviewService.new(self.request, self.params)
  end

end
