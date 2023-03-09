Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events, only: [:show, :new, :index, :create, :edit, :update, :destroy] do
    member do
      get "set_decade"
      get "set_genre"
      get "users"
      post "selected_movies", to: "selected_movies#create"
    end
    # resources :selected_movies, only: [:index, :show, :update, :create]
    # resources :invitations, only: [:create]
  end
  resources :invitations, only: [:index]
end
