Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard"
  get "/dashboard/:booking", to: "bookings#accept_booking", as: 'confirmed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [ :update, :edit ]
end
