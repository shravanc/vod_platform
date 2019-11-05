class Tenant < ApplicationRecord

belongs_to :provider
has_many :apps

validates :title, presence: true, uniqueness: true
#validates :subdomain, presence: true, uniqueness: true


def create params
  tenant = Tenant.new(params.require(:tenant).permit([:title, :subdoamin]))
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

private

def tenant_parameters(params)
  params.require(:provider).permit( tenant_attributes )
end

def tenant_attributes
  [ :id, :title, :email]
end

end