Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trivia_zone#index'
  resources :trivia_zone, only: [:index, :show]

  resources :topics do
    resources :trivias do
      member do
        get :result
      end
    end
  end

  # trivias/:trivia-id/trivia_sessions/new -> create -> show
  resources :trivias do
    resources :trivia_sessions
  end
end
