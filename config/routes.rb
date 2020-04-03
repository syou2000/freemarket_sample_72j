Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    get 'users/authentication', to:'devise/registrations#authentication'
    get 'users/complete', to:'devise/registrations#complete'
  end
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
