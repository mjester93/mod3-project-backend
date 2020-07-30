Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_wishlists
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
      resources :games
      resources :platforms
      resources :reviews
      resources :user_games
      get "users/find_user/:name", to: "users#find_user", as: "find_user"
      delete "users/delete_game/:id", to: "users#delete_game", as: "user_delete_game"
      delete "users/delete_wishlist/:id", to: "users#delete_wishlist", as: "user_delete_wishlist"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
