Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :users,
              controllers: {
                registrations: 'users/registrations',
                sessions: 'users/sessions',
                omniauth_callbacks: 'users/omniauth_callbacks',
                # user: 'users'
                }
  
#profile routes
  resources :users, only: [] do
    resources :profiles
  end
#follow routes
  resources :users do
    member do
      get :following, :followers
    end
  end
#recipe routes for comments and likes
  resources :recipes do 
    resources :comments, module: :recipes
    resource :like, module: :recipes
  end
#recipe route to add ingredients to shopping list
  resources :recipes do
    member do
      post 'add_to_shopping_list'
    end
  end
#comment routes for comments on comments
  resources :comments do
    resources :comments, module: :comments
  end
  #shopping list routes for shopping list items and ingredients
  resources :shopping_lists do
    resources :shopping_list_item
    # resources :ingredients, only: [:new, :create, :destroy]
  end
#ingredient routes to add/remove ingredients from recipe
  resources :ingredients, only: [], param: :index do
    member do
      delete '(:id)' => "ingredients#destroy", as: ""
      post '/' => "ingredients#create"
    end
  end

  #general routes
  resources :shopping_list_items
  resources :users
  resources :profiles 
  resources :recipes 

  # relationship and follow routes
  resources :relationships, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]

  # notification routes
  resources :notifications, only: [:index, :update, :show]

  # cors preflight check 
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]


end 
