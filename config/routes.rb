Rails.application.routes.draw do
  root "home#index"

  resources :articles, only: [ :index ] do
    # This is not very RESTful and a fallback while I work on ActionCable
    get 'like', to: 'articles#like', as: 'like'
  end
end
