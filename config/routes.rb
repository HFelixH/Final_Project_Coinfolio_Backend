Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :trades
      resources :users
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'

      post '/signup', to: 'users#create'
      get '/me', to: 'users#show'
      patch '/me', to: 'users#update'
    end
  end
  get '*path', to: 'fallback#index', constraints: ->(request) { !request.xhr? && request.format.html? }
end
