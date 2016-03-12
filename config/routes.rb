Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  get 'welcome/index'

  resources :games, only: [:new] do
    collection do
      get :find
    end
  end

end
