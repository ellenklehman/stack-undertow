Rails.application.routes.draw do

  root to: 'application#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :questions, except: :index
  end

  resources :questions, only: [:index, :show] do
    resources :answers
  end


  resources :sessions

end
