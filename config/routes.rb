Rails.application.routes.draw do
  resources :umanagements, only: :index
  devise_for :users
  root to: "managements#index"
  resources :users, only: :show
end
