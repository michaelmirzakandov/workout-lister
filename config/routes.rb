Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :workouts, only: [:index, :show, :create, :new] do
    resources :exercises, only: [:show, :index, :new, :edit ]
  end
  resources :exercises

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
