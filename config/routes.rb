Rails.application.routes.draw do
  resources :reviews
  root "movies#index"
  resources :movies do
    resources :reviews
  end
  #delete "/movie/:id" => "movies#destroy", as: "delete_movie"
end
