Rails.application.routes.draw do
  resources :homes, only: :index
  devise_for :users
  root to: "homes#index"
  resources :users, only: :show
  resources :items do
    collection do
      get 'search'
    end
  end  
end
