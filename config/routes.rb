Rails.application.routes.draw do

  get 'tag/show'

  get 'tag/create'

  get 'add_tag/show'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  	get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  post "/rent" => "rents#create" , as: "register_rent"
  get "/rent" => "rents#new" , as: "rent"
  get "/test" => "test#show", as: "asd"
  get "/tag" => "tag#new" , as: "tag"
  post "/tag" => "tag#create" , as: "tagcreate"
  get "/tag/show/:id" => "tag#show" , as: "showtag"
  get "/tag/index" => "tag#index" , as: "showalltag"
  get "/checkboxes" => "tag#checkbox" , as: "getcheck"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:create, :index]
  # resources :tag
end
