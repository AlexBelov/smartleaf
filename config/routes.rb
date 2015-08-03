Rails.application.routes.draw do
  root to: 'purchases#index'
  devise_for :users
end
