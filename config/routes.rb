Rails.application.routes.draw do
  resources :gossip do
    resources :comment
  end
  resources :user
  resources :city, only: [:show]
  root 'gossip#index'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:name', to: 'gossip#welcome'
end
