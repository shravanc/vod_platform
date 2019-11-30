
=begin
provider = Provider.where(title: 'netflix').first_or_create

tenant = Tenant.where(title: 'tenant_1', subdomain: 'netflix', provider_id: provider.id).first_or_create

app = App.where(title: "android", tenant_id: tenant.id ).first_or_create

services = Service.where(system: [{"service": "list_system", "host": "http://localhost:3001/items"}, {"service": "user_system", "host": "http://localhost:3002/users" }]).first_or_Create
=end

provider = Provider.where(title: 'amazon').first_or_create
tenant   = Tenant.where(title: 'amazon', subdomin: 'amazon', provider_id: provider.id).first_or_create
app      = App.where(title: "android", tenant_id: tenant.id).first_or_create

provider = Provider.where(title: 'netflix').first_or_create
tenant   = Tenant.where(title: 'netflix', subdomin: 'netflix', provider_id: provider.id).first_or_create
app      = App.where(title: "android", tenant_id: tenant.id).first_or_create
