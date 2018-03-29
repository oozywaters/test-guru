Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  post :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  namespace :admin do
    resources :tests, shallow: true do
      resources :questions
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
