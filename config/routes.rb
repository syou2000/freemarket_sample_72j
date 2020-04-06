Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    get 'users/authentication', to:'devise/registrations#authentication'
    get 'users/complete', to:'devise/registrations#complete'
  end
  root 'top_page#index'
  get "items/sample_show", to: "items#sample_show"
  get "items/sample_show2", to: "items#sample_show2"
end
