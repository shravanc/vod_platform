
provider = Provider.where(title: 'netflix').first_or_create

tenant = Tenant.where(title: 'tenant_1', subdomain: 'netflix', provider_id: provider.id).first_or_create

app = App.where(title: "android", tenant_id: tenant.id ).first_or_create


