Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise
  devise_for :users, skip: 'sessions', controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # Defines the root path route ("/")
  root "home#index"

  # search item
  get '/search', to: 'items#search', as: :search_items

  # get all items by category
  get '/category/:id', to: 'items#get_items_by_category', as: :get_items_by_category
end
