Rails.application.routes.draw do
  get 'campers/skip'
  get 'campers/spec'
  resources :campers, only: [:index, :show, :create]
  resources :activities, only: [:index, :destroy]
  resources :signups, only: [:create]
end
