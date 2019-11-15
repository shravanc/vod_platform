class ApplicationController < ActionController::API

before_action :validate_auth_token


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

def validate_auth_token
  puts(params)
  @app = nil
  if auth_token = params[:auth_token]
    return if auth_token == SECRET_KEY
  end
  
  TOKEN_LIST.each do | tk |
    Rails.logger.warn "***#{tk}***"
    @app = tk[:resource].capitalize.constantize.find_by_auth_token(params[:auth_token])
    break if @app
  end
  
  if @app.nil?
    render json: {message: "Invalid auth_otken"}
  end

  if !@app.tenants.empty?
    subdomain = @app.tenants.last.subdomain
    Apartment::Tenant.switch(subdomain) do 
      p "switching the schema"
    end if subdomain
    return
  end

end

def render_error(resource, status)
  render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
end



end
