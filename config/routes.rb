Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    # get 'users/:id/authentication', to:'devise/registrations#authentication', as: :user_authentication
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    # get 'users/complete', to:'devise/registrations#complete'
  end
  root 'top_page#index'
  resources :users, only: [:new]
  resources :items, only: [:create,:destroy]
  get 'exhibition/index'
  get "items/sample_show", to: "items#sample_show"
  get "items/sample_show2", to: "items#sample_show2"
end

