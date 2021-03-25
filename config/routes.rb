Rails.application.routes.draw do
  root 'sessions#home'

  get '/users/most-active' => 'users#most_active'

#place custom routes here above resources!
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
#login & logout routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  delete '/logout' => 'sessions#destroy'

  #google omniauth
  get '/auth/:provider/callback' => 'sessions#google'

  # resources :categories
  resources :missions do
    resources :feedbacks
  end
  resources :feedbacks
  resources :users do
    resources :missions, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



# NESTED ROUTES
# new, show, index

# '/users'
# '/users/:id/missions'
# '/users/:id/feedbacks'

# '/missions'
# '/missions/:id/feedbacks'