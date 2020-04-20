class SubscriptionDispatcher < ReviewDispatcher

  def initialize(interceptors)
    @interceptors = interceptors
  end

  def event_triggered context
    @context = context
    dispatch
  end

  private
  def dispatch
    @interceptors.each do |interceptor|
      status = interceptor.perform(@context)
      return status unless status
    end
  end

end
