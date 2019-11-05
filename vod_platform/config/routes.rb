Rails.application.routes.draw do

resources :providers do
  resources :tenants do 
    resources :apps 
  end
end


end
