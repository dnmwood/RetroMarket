Rails.application.routes.draw do
  devise_for :users
  get 'homepage/index'

  root to: 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
