Rails.application.routes.draw do

  get 'items/create'

  get 'users/show'

  devise_for :users

  resources :users, only: [:show] do
      resources :items, only: [:create, :destroy]
    end

  get 'welcome/index'
  get 'welcome/show'

  root 'users#show'

end
