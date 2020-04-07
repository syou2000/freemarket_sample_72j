Rails.application.routes.draw do
  root 'top_page#index'
  resources :users, only: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "items/sample_show", to: "items#sample_show"
  get "items/sample_show2", to: "items#sample_show2"
end