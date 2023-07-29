Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :users,
              controllers: {
                registrations: 'users/registrations',
                sessions: 'users/sessions',
                omniauth_callbacks: 'users/omniauth_callbacks'
                }
  
  resources :recipes  
  resources :shopping_lists

  resources :ingredients, only: [], param: :index do
    member do
      delete '(:id)' => "ingredients#destroy", as: ""
      post '/' => "ingredients#create"
    end
  end
end 
