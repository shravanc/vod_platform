class Tenant < ApplicationRecord

belongs_to :provider
has_many :apps

validates :title, presence: true, uniqueness: true
validates :subdomain, presence: true, uniqueness: true

before_create :create_auth_token
before_create :update_micro_services
after_create :create_subdomain


before_destroy :destroy_subdomain
before_destroy :update_micro_services_schema
def create params
  tenant = Tenant.new(params.require(:tenant).permit([:title, :subdomain]))
  tenant.provider_id = params[:provider_id]
  tenant.save

  if tenant.valid?
     message = { message: 'Tenant created succesfully', data: tenant.id}
  else
    
    message = {message: 'Invalid'}
  end
  return [ true, message ]
end


def update params
  provider = Tenant.find(params[:id])
  if provider
    provider.update_attributes(tenant_parameters(params))
    message = {message: 'Tenant updated succesfully'}
    return [true, message]
  else
    message = {message: 'Tenant not found'}
    return [false, message]
  end
end

def index
  return true, { tenants: Tenant.all.as_json( only: tenant_attributes) }
end

def show params
  provider = Tenant.find(params[:id])
  return true, provider.as_json(only: tenant_attributes)
end

def update_micro_services
  services = YAML.load_file("#{Rails.root.to_s}/lib/modules/services.yml")
  headers = {'Content-Type'=>'application/json', 'Accept' => 'application/json'}

  services["services"].each do |k, v|
    if ['recommend', 'review'].include?k
      next
    end
    url = "http://localhost:#{v["port"]}/tenants"
    body = {"tenant" => {"title"=> self.title, "subdomain" => self.subdomain} }
    HTTParty.post(url, :headers => headers, :body => body.to_json)
  end
end
def update_micro_services_schema
  services = YAML.load_file("#{Rails.root.to_s}/lib/modules/services.yml")
  headers = {'Content-Type'=>'application/json', 'Accept' => 'application/json'}

  services["services"].each do |k, v|
    url = "http://localhost:#{v["port"]}/tenants/#{self.subdomain}"
    body = { "subdomain" => self.subdomain }
    HTTParty.delete(url, :headers => headers, :body => body.to_json)
  end
end
private

def tenant_parameters(params)
  params.require(:provider).permit( tenant_attributes )
end

def tenant_attributes
  [ :id, :title ]
end

def create_subdomain
  Rails.logger.warn self.subdomain
  Apartment::Tenant.create(self.subdomain)
end

def destroy_subdomain
  Apartment::Tenant.drop(self.subdomain)
end




end
