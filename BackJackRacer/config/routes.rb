Rails.application.routes.draw do
 
root :to => 'users#index'

get '/', to: 'users#index', as: 'index'

post '/', to: 'users#create', as: 'new'

post '/', to: 'users#signin', as: 'signin'

resources :rounds, only: [:new, :create, :show]

end
