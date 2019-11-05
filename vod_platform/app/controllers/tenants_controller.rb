class TenantsController < ApplicationController

def create
  tenant = Tenant.new
  status, data = tenant.create(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :untenantrocessable_entity
  end
end

def update
  tenant = Tenant.new
  status, data = tenant.utenantdate(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :untenantrocessable_entity
  end
end

def index
  tenant = Tenant.new
  status, data = tenant.index
  if status
    render json: data, status: :ok
  else
    render json: data, status: :untenantrocessable_entity
  end
end

def show
  tenant = Tenant.new
  status, data = tenant.show(params)
  if status
    render json: data, status: :ok
  else
    render json: data, status: :untenantrocessable_entity
  end
end

def destroy
  tenant = Tenant.new
  status, data = tenant.destroy(params)
  if status
    render json: data, status: :created
  else
    render json: data, status: :untenantrocessable_entity
  end
end


end
