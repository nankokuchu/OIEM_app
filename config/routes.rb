Rails.application.routes.draw do
  get 'managements/index'
  devise_for :users
  root to: "managements#index"
end
