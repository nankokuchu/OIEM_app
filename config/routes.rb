Rails.application.routes.draw do
  resources :homes, only: :index
  devise_for :users
  root to: "homes#index"
  resources :users, only: :show

  resources :manages, only: [:index] do
    collection do
      get 'm-new'
      get 'm-processing'
    end
  end

  resources :infos, only: [:new, :create]

  resources :tracking_numbers, only: :update

  resources :orders, only: [:index, :edit, :update] do
    resources :tracking_numbers, only: [:index, :create]
    resources :manages, only: [:new, :create]
    collection do
      get 'processing'
      get 'tracking'
      get 'processed'
      get 'cancel'
      get 'sent'
    end
  end
  
  resources :items do
    resources :orders, only: [:new, :create]
    collection do
      get 'search'
    end
  end  
end
