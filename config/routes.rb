Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users, only: [:show] do
      resources :items, only: [:create, :destroy]
      patch 'completed/:id', to: 'items#complete', as: :complete_item
    end

  root 'users#show'

end
