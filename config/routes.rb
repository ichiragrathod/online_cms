Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/complaints'
    get 'admin/show_complaint'
    get 'admin/users'
  end
  
  
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :complaints
  resources :users, only: [:show]
  root 'home#index'
end
