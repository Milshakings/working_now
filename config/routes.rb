Rails.application.routes.draw do
  devise_for :users
  resources :people
  get 'offers/index'
  get 'offers/show'
  get 'offers/new'
  get 'offers/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :offers
  # Defines the root path route ("/")
   root "offers#index"
end
