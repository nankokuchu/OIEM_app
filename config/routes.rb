Rails.application.routes.draw do
  resources :homes, only: :index
  devise_for :users
  root to: "homes#index"
  resources :users, only: :show

  resources :manages, only: [:index] do
    collection do
      get 'm_new_item'
      get 'm_processing'
      get 'm_new_order'
      get 'm_sent_order'
    end
    member do
      get 'm_new_order_show'
      get 'm_new_order_tracking_new'
      post 'm_new_order_tracking_create'
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
    end
    member do
      post 'order_cancel_create'
    end
  end
  
  resources :items do
    resources :orders, only: [:new, :create]
    collection do
      get 'search'
      get 'item_hidden'
      get 'item_shiping'
    end
  end  

  resources :kaigai_orders, only: [:new, :create, :index, :show] do
    resources :kaigai_order_cancels, only: [:new, :create]
    resources :kaigai_order_pays, only: [:new, :create]
    resources :invoices, only:[:new, :create]
    collection do
      get 'kaigai_new'
      get 'kaigai_ship'
      get 'kaigai_cancel'
      get 'kaigai_invoice'
      get 'kaigai_sent'
    end
    member do
      post 'kaigai_order_over_create'
    end
  end

  resources :invoices, only:[:show]
end
