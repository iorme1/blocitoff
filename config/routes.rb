Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get 'welcome/show'

  root 'welcome#index'

end
