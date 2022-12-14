Rails.application.routes.draw do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    get "/get_user", to: "users#show"
    resources :models
    resources :brands, only: [:index, :show, :create, :update, :destroy] do
      get :logo, on: :member
    end
end
