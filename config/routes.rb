Rails.application.routes.draw do
  resources :gossip do
    resources :comment
    resources :like, only: %i[new create destroy]
  end
  resources :user
  resources :city, only: [:show]
  resources :session, only: %i[new create destroy]
  root 'gossip#index'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:name', to: 'gossip#welcome'
end
