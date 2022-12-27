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

  # show item detail
  get '/items/:id', to: 'items#show', as: :show_item

  # favorite item
  post '/items/:id/favorite', to: 'items#favorite', as: :favorite_item

  # add item to cart
  post '/items/:id/add-cart', to: 'items#add_item', as: :add_item

  # show cart detail
  get '/users/:id/cart', to: 'users#show_cart', as: :user_cart

  # confirm order
  post '/users/:id/confirm-order', to: 'users#confirm_order', as: :confirm_order

  # thanks page(order complete)
  get '/thanks', to: 'home#thanks', as: :thanks

  # review
  post 'users/:id/items/:item_id/review', to: 'reviews#review', as: :review_item
end
