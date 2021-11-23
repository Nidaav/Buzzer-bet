Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :users
  resources :leagues, only: %i[new create show] do
    resources :memberships, only: %i[new create]
  end
  resource :dashboard, only: :show
  resources :bets, only: %i[edit update]
  resources :games, only: %i[show index]
  resources :teams, only: %i[show index]
end
