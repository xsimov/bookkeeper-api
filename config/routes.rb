Rails.application.routes.draw do
  resources :shopping_orders, only: :create
end
