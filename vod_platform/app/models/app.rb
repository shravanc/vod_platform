class App < ApplicationRecord

belongs_to :tenant

validates :title, presence: true, uniqueness: true

before_create :create_authtoken

def create params
  app = App.new(params.require(:app).permit([:title]))
  app.tenant_id = params[:tenant_id]
  Rails.logger.warn app.inspect
  app.save
  Rails.logger.warn app.errors.inspect
  if app.valid?
    message = { message: 'App created succesfully'}
    return [true, message]
  else
    return [false, app]
  end
end

def update params
  app = App.find(params[:id])
  if app
    app.update_attributes(app_parameters(params))
    message = {message: 'App updated succesfully'}
    return [true, message]
  else
    message = {message: 'App not found'}
    return [false, message]
  end
end

def index
  return true, { apps: App.all.as_json( only: app_attributes) }
end

def show params
  app = App.find(params[:id])
  return true, app.as_json(only: app_attributes)
end

private

def app_parameters(params)
  params.require(:app).permit( app_attributes )
end

def app_attributes
  [ :id, :title, :email]
end

end
