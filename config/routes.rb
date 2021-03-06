Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :devices do
    resources :rents, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/my_bookings", to: "rents#my_bookings"
  get "/my_devices", to: "devices#my_devices"

  resources :rents, only: [] do
    member do
      patch "accepted"
      patch "pending"
      patch "refused"
    end
  end
end
