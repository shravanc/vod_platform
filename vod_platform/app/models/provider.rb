class Provider < ApplicationRecord

has_many :tenants
validates :title, presence: true, uniqueness: true
#validates :slug, uniqueness: true


before_create :create_authtoken
after_create :send_notification

def create params
  provider = Provider.new(params.require(:provider).permit([:title, :description]))
  provider.save


  message = { message: 'Provider created succesfully', data: provider.id}
  return [ true, message ]
end


def create params
  provider = Provider.create(provider_parameters(params))
  if provider.valid?
    message = { message: 'Provider created succesfully'}
    return [true, message]
  else
    return [true, {error: "to be completed"}]
  end
end

def update params
  provider = Provider.find(params[:id])
  if provider
    provider.update_attributes(provider_parameters(params))
    message = {message: 'Provider updated succesfully'}
    return [true, message]
  else
    message = {message: 'Provider not found'}
    return [false, message]
  end
end

def index
  return true, { providers: Provider.all.as_json( only: provider_attributes) }
end

def show params
  provider = Provider.find(params[:id])
  return true, provider.as_json(only: provider_attributes)
end

private

def provider_parameters(params)
  params.require(:provider).permit( provider_attributes )
end

def provider_attributes
  [ :id, :title, :email]
end

end
