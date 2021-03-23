Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tweets#index'

  get '/users/sign_in', to: 'users#log_in'
  put '/users/sign_in', to: 'users#sign_in'
  put '/users/sign_up', to: 'users#sign_up'
  delete '/users/log_out', to: 'users#log_out'

  resources :tweets
  resources :users 

  resources :users, only: %i[show] do
    resources :followings, only: %i[create]
  end

  resources :followings, only: %i[destroy]

  resources :tweets, only: [:index, :create] do
    resources :likes, only: [:create, :destroy]
  end
  
end
