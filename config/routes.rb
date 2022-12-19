Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth' 

  resources :users
  resources :workouts do
    resources :exercises
  end
  resources :exercises

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
