Rails.application.routes.draw do
  
get '/', to: 'users#index'

post '/', to: 'users#new', as: 'new'

post '/', to: 'users#signin', as: 'signin'

get '/round/new', to: 'rounds#new', as: 'new_rounds'

end
