Rails.application.routes.draw do
  resources :providers, only: %i(index show create)
  resources :shopping_orders, only: %i(index create show)
end
