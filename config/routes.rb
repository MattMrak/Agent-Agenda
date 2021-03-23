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
  resources :users do
    resources :missions, only: [:new,:create,:index]
  end
  resources :missions do
    resources :feedbacks, only: [:new,:create,:index]
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