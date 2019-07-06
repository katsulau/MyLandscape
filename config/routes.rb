Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  # For details on the DSL available within this file, see

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users, only:[:edit, :update, :show]

    resources :posts, only:[:index, :new, :create, :edit, :update, :show] do
      resources :comments, only:[:create]
      resources :favorites, only: [:create, :destroy]
    end

    root "toppages#index"
  end
end
