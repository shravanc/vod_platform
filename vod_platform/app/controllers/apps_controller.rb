class AppsController < ApplicationController

def create
  app = App.new
  status, data = app.create(params)
  if status
    render json: data, status: :created
  else
    Rails.logger.warn("***********************ERROR*************")
    render_error(data, :unapprocessable_entity)
    #render json: data, status: :unapprocessable_entity
  end
end

def update
  app = App.new
  status, data = app.update(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :unapprocessable_entity
  end
end

def index
  app = App.new
  status, data = app.index
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unapprocessable_entity
  end
end

def show
  app = App.new
  status, data = app.show(params)
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unapprocessable_entity
  end
end

def destroy
  app = App.new
  status, data = app.destroy(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :unapprocessable_entity
  end
end



end
