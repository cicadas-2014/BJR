Rails.application.routes.draw do

root :to => 'users#index'

post '/', to: 'users#create', as: 'new'

post '/users', to: 'users#signin', as: 'signin'

get '/logout', to: 'users#logout', as: 'logout'

get '/rounds/:id/results', to: 'rounds#results', as: 'round_results'

resources :rounds, only: [:new, :create, :show]

resources :users, only: [:show]

end
