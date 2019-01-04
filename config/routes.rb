Rails.application.routes.draw do
  # Games pages, user authentication required
  resources :games, only: [:index, :show, :new, :console_list]
  devise_for :users

  root to: 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
