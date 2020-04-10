Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'top_page#index'
  resources :users, only: [:new]
  resources :items, only: [:create, :destroy, :edit]
  resources :exhibition, only: [:index]
  get 'exhibition/index'
  get "items/edit"
  get "items/sample_show", to: "items#sample_show"
  get "items/sample_show2", to: "items#sample_show2"
end

