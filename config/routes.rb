Rails.application.routes.draw do
  root to: 'toppages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #newのurlをsignupにする
  #resourcesに:newも追加しているので/users/newでも新規登録ページが表示される
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
