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

  get '/lists', to: redirect('admin/lists')
  get '/lists/:id', to: redirect('admin/lists/%{id}')

  get '/items', to: redirect('admin/items')
  get '/items/:id', to: redirect('admin/%{id}')

  get '/media', to: redirect('admin/media')
  get '/media/:id', to: redirect('admin/media/%{id}')

  get '/layouts', to: redirect('admin/layouts')
  get '/layouts/:id', to: redirect('admin/layouts/%{id}')


  get 'users/confirmation', to: "users#confirmation"
  resources :users  
  resources :sessions
  

end
