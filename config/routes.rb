Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'welcome/index'

  resources :games, only: [:index, :show, :new, :create, :update, :edit] do
    collection do
      get :find
    end
  end

  resources :rooms
end
