Rails.application.routes.draw do
  get 'pages/index'
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'welcome#index' 
  get '/about', to: 'pages#about', as: 'about'
  get '/index', to: 'pages#index', as: 'Home'
  get '/content', to: 'pages#content', as: 'Content'

resources :parks, only: [:index]
resources :wildlife, only: [:index]
resources :visitors, only: [:index]
resources :facilities, only: [:index]

resources :parks, only: [:show]
resources :wildlife, only: [:show]
resources :visitors, only: [:show]
resources :facilities, only: [:show]


resources :parks do
  resources :wildlife, only: [:show]
  resources :visitors, only: [:show]
  resources :facilities, only: [:show]
end

resources :wildlife, only: [:show]
resources :visitors, only: [:show]
resources :facilities, only: [:show]


end


