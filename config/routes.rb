Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only:[:index, :new, :create, :edit, :show] do
    resources :comments, only:[:create]
  end

  resources :users, only:[:show]

  root "toppages#index"
end
