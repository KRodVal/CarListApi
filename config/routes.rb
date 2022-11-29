Rails.application.routes.draw do
    resources :users, only: [:create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    resources :models
    resources :brands, only: [:index, :show, :create, :update, :destroy] do
      get :logo, on: :member
    end
end
