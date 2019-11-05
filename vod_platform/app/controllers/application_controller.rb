class ApplicationController < ActionController::API

before_action :validate_authtoken


def validate_resource resource
  @resource = resource.capitalize.constantize.find_by_id(params[:id])
end

private


def get_token

end

def validate_authtoken
  if authtoken = params[:authtoken]
    return if authtoken == SECRET_KEY
  end
  
  TOKEN_LIST.each do |h |
    @app = tk[:resource].capitalize.constantize.find_by_authtoken(params[tk[:token_name]])
    break if app
  end

  subdomain = app.tenant.last.subdomain
  Apartment::Tenant.switch(subdomain)

  render json: {message: "Invalid authtoken"}, status: :unprocessable_entity
end



end
