Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"
    post "/sessions" => "sessions#create"
    post "/posts" => "posts#create"
    get "/posts/:id" => "posts#show"
    patch "/posts/:id" => "posts#update"
    delete "posts/:id" => "posts#destroy"
    get "/courses" => "courses#index"
    get "/courses/:id" => "courses#show"
    get "/resources" => "resources#index"
    get "/resources/:id" => "resources#show"
    get '/messages' => 'messages#index'
    post '/messages' => 'messages#create' 
  end 


end
