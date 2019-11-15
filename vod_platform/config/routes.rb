Rails.application.routes.draw do

resources :providers do
  resources :tenants do 
    resources :apps do
      resources :services
    end
  end
end

#User System
  resources :users do
    collection do
      post :forgot_password
      get :confirmation
      put :set_password
    end
  end

  resources :sessions do
    post :update_profile
    put :change_password
  end


#List System
  resources :lists
  resources :items
  resources :media
  resources :layouts



end
