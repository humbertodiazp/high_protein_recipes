Rails.application.routes.draw do
  root 'recipes#home'

  resources :ingredients, only: [], param: :index do
    member do
      delete '(id)' => 'ingredients#destroy', as: ""
      post '/' => 'ingredients#create'
    end
  end
  
  
  resources :recipes 
  resources :users, only: %i[index]

  devise_for :users,
              controllers: {
                registrations: 'users/registrations',
                sessions: 'users/sessions',
                omniauth_callbacks: 'users/omniauth_callbacks'
                }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

