Rails.application.routes.draw do
  root "movies#index"
  resources :movies

  #delete "/movie/:id" => "movies#destroy", as: "delete_movie"
end
