Rails.application.routes.draw do

  root to: 'pages#home'
  ressources :users do
    ressources :leagues
  end
  devise_for :users
end
