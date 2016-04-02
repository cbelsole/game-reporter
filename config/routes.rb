Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'welcome/index'

  resources :games, only: [:index, :show, :new, :create, :update, :edit] do
    collection do
      get :find
      get :join
    end
  end

  resources :rooms
end
