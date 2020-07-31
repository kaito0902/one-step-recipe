Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :recipes do
    resources :comments, only: [:create]
    collection do
      get :time
      get :time2
      get :time3
      get :time4
    end
  end
end
