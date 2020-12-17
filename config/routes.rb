Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :conditions do
    collection do
      get 'temp'
      get 'weight'
      get 'blood_max'
      get 'blood_min'
      get 'com'
    end
  end
end
