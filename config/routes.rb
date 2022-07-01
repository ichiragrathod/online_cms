Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/complaints'
    get 'admin/show_complaint/:id', to: 'admin#show_complaint', as: 'admin_complaint'
    get 'admin/users'
    patch 'update_complaint/:id', to: 'admin#update', as: 'complaint_update'
    get 'admin/edit/:id', to: 'admin#edit', as: 'complaint_edit'
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
