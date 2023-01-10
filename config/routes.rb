Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth' 

  Rails.application.routes.draw do
    resources :users do
      resources :exercises
    end
    resources :users do
      resources :workouts do
        resources :catagories
      end
    end
    resources :workouts do 
      resources :workout_exercises
    end
    resources :exercises
  end
  

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
