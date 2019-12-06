Rails.application.routes.draw do
  devise_for :users

  root controller: :stations, action: :index

  resources :log_entries
  resources :events
  resources :stations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
