Rails.application.routes.draw do
  root 'gossip#index'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:name', to: 'gossip#welcome'
  get '/gossip/:id', to: 'gossip#show'
  get '/author/:id', to: 'author#show'
end
