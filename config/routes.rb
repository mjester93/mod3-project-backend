Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :games
      resources :platforms
      resources :reviews
      get "users/find_user/:name", to: "users#find_user", as: "find_user"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
