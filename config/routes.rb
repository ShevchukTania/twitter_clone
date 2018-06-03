Rails.application.routes.draw do
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' =>'users#new'
  get 'search'  => 'home#search'
  resources :sessions
  resources :home
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  resources :users do
    get 'tweets' => 'users#tweets'
    member do
      get 'following' => 'relationships#create'
      get 'followings' => 'users#followings'
      get 'followers' => 'users#followers'
    end
  end
  root 'home#index'
end
