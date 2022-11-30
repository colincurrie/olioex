Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: [ :index ]
  # do
  #   get '/page/:page', action: :index, on: :collection
  # end
end
