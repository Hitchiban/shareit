Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :devices do
    resources :rents, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/my_bookings", to: "rents#my_bookings"
end

