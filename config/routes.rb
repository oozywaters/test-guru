Rails.application.routes.draw do
  get 'feedback/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :feedbacks, only: [:new, :create]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
end
