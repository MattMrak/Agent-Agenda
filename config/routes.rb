Rails.application.routes.draw do
  root 'sessions#home'

#place custom routes here above resources!
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
#login & logout routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # resources :categories
  resources :feedbacks
  resources :users
  resources :missions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
