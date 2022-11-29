Rails.application.routes.draw do
    resources :users
    resources :models
    resources :brands, only: [:index, :show, :create, :update, :destroy] do
      get :logo, on: :member
    end
end
