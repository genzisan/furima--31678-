Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'furimas#index'
  resources :furimas, only: [:index, :new, :create, :show] do
    resources :purchases, only: [:index, :create]
  end
end
