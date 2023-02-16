Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  get 'statics/top'  => 'statics#top'
  get 'statics/about' => 'statics#about'
  root 'statics#top'
  resources :cooks do
    resources :likes, only: [:create, :destroy]
  end
end