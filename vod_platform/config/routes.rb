Rails.application.routes.draw do

resources :providers do
  resources :tenants do 
    resources :apps do
      resources :services
    end
  end
end


end
