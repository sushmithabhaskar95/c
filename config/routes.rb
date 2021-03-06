Rails.application.routes.draw do

# get    '/users',  to: 'users#new'
  # post    '/users',  to: 'users#create'
  # resources :users 

  
  # # delete '/delete/:id', to:'roles#destroy'
  # get '/delete/:id',to: 'roles#destroy'
  # delete '/roles/:id(.:format)', to:'roles#destroy'

  # get   '/roles',  to: 'roles#new'
  # post '/roles', to:'roles#create'
  # resources :roles

  # get '/addrole', to: 'roles#new'
  # get '/adduser', to: 'users#new' 

  resources :teams do
    collection do
    get :load_users
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  resources :user_roles
  resources :roles
  resources :users 
  resources :players
  root   'home#home'
end
