class ApplicationController < ActionController::API

before_action :validate_authtoken


def validate_resource resource
  resource = resource.capitalize.constantize 
  begin
     @resource = resource.find params[:id]
  rescue ActiveRecord::RecordNotFound
     p @resource
     @resource = resource.new
     @resource.errors.add(:id, "Wrong ID provided")
     render_error(@resource, 404) and return
  end
end



private


def get_token

end

def validate_authtoken
  puts(params)
  if authtoken = params[:authtoken]
    return if authtoken == SECRET_KEY
  end
  
  TOKEN_LIST.each do | tk |
    @app = tk[:resource].capitalize.constantize.find_by_authtoken(params[tk[:token_name]])
    break if app
  end

  subdomain = app.tenant.last.subdomain
  Apartment::Tenant.switch(subdomain) if subdomain

  render json: {message: "Invalid authtoken"}, status: :unprocessable_entity
end

def render_error(resource, status)
  render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
end



end
