Rails.application.routes.draw do
  root 'store#index'

  get 'store/index'

  resources :products
  resources :line_items, only: [:create]
  # except: [:delete] ...also works!
  resources :carts

end
