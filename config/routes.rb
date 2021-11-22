Rails.application.routes.draw do

  root to: 'pages#home'
  resources :users do
    resources :leagues
  end
  devise_for :users
end
