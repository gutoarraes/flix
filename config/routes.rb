Rails.application.routes.draw do
  resources :reviews
  root "movies#index"
  resources :movies

  #delete "/movie/:id" => "movies#destroy", as: "delete_movie"
end
