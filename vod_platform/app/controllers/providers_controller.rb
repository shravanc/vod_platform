class ProvidersController < ApplicationController
  
def create
  p = Provider.new
  status, data = p.create(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :unprocessable_entity
  end
end

def update
  p = Provider.new
  status, data = p.update(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :unprocessable_entity
  end
end

def index
  p = Provider.new
  status, data = p.index
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

def show
  p = Provider.new
  status, data = p.show(params)
  if status
    render json: data, status: :ok
  else
    render json: data, status: :unprocessable_entity
  end
end

def destroy
  p = Provider.new
  status, data = p.destroy(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :unprocessable_entity
  end
end


end
