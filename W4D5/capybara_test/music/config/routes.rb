Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :new, :show]

  resource :session, only: [:create, :destroy, :new]

  root 'sessions#new'
end
