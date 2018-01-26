Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :leaderboards, only: [:index]

  resources :topics, only: [:create, :index, :new] do
    resources :trivias, except: [:show, :index]
  end

  resources :trivia_zone, only: [:index, :show]

  resources :trivias, only: [] do
    resources :trivia_sessions, only: [:create, :destroy, :new]
  end

  resources :users, only: [] do
    resources :trivia_sessions, only: [:index]
  end

  resources :trivia_sessions, only: [:show]

  resources :topics, only: [:show]

  root "trivia_zone#index"
end
