Rails.application.routes.draw do
  devise_for :users
  root to: 'devices#index'
  resources :devices, only: [:index, :show] do
    resources :rents, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

