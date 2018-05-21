Rails.application.routes.draw do
  get 'tweets/new'
  get 'tweets/destroy'
  get 'tweets/show'
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' =>'users#new'

  resources :sessions
  resources :home
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get 'following' => 'relationships#create'
      post 'unfollowing' => 'relationships#destroy'
    end
  end
  root 'home#index'
end
