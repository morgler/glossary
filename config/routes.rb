Rails.application.routes.draw do
  resources :definitions

  devise_for :users

  root 'definitions#index'
end
