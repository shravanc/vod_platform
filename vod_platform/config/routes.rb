Rails.application.routes.draw do

resources :providers do
  resources :tenants do 
    resources :apps do
      resources :services
    end
  end
end

namespace :admin do
  resources :users
  resources :sessions do 
    resources :items
    resources :lists
    resources :layouts
    resources :media
  end
  resources :roles do
    resources :privileges
  end
  resources :lists
  resources :items
  resources :media
  resources :layouts
end








end
