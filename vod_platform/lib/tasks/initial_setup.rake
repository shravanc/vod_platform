desc "Setting Up Vod Platform"
task "initial_setup" do
provider = Provider.where(title: 'amazon').first_or_create
tenant   = Tenant.where(title: 'amazon', subdomin: 'netflix', provider_id: provider.id).first_or_create
app      = App.where(title: "android", tenant_id: tenant.id).first_or_create
end
