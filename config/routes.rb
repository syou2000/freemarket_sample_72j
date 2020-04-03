Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    get 'users/authentication', to:'devise/registrations#authentication'
    get 'users/complete', to:'devise/registrations#complete'
  end
  root 'items#index'
end
