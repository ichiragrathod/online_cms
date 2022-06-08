Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :complaints
  root 'home#index'
end
