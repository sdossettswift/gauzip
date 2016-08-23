Rails.application.routes.draw do
  get 'dashboard/welcome'
  resources :users
  root 'dashboard#welcome'
end
