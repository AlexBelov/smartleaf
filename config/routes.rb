Rails.application.routes.draw do
  root to: 'purchases#index'
  devise_for :users

  resources :purchases

  resources :admin do
    collection do
      get :purchases
      get :users_negative_10
      get :users_negative_30
      get :users_negative_10_30
    end
  end
end
