Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trivia_zone#index'
  resources :trivia_zone, only: [:index]
  resources :topics do
    resources :trivias
  end
end
