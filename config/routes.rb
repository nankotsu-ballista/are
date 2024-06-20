Rails.application.routes.draw do
  get "/metanew",  to:'metamons#new'
  get "/metamonshow",  to:'metamons#show'
  get 'sessions/new'
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/sign",  to: "scores#new"
  get  "/main",  to: "scores#main"
  get  "/daiichi",  to: "scores#daiichi"
  get  "/show",  to: "scores#show"
  get  "/tesuto",  to: "champs#new"
  get  "/hontouroku",  to: "temps#name"
  get  "/tempcon",  to: "temps#confirm"
  get  "/signup",  to: "users#new"
  get  "/usershow",  to: "users#show"
  get  "/usercon",  to: "users#confirm"
  get  "/kateindex",  to: "kategoris#index"
  get  "/useredit",  to: "users#edit"
  get    "/login",   to: "sessions#new"
  get    "/templenew",   to: "templates#new"
  get    "/templesearch",   to: "templates#search"
  get    "/tempshow",   to: "temps#show"
  get    "/scoeasy",   to: "scores#easy"
  get    "/which",   to: "metamons#which"
  get    "/easyscore",   to: "scores#easyscore"
  get    "/easymain",   to: "scores#easymain"
  get    "/easysituation",   to: "scores#easysituation"
  get    "/easysynergy",   to: "scores#easysynergy"
  get    "/easykihon",   to: "scores#easykihon"
  get    "/tempedit",   to: "champs#edit"
  get    "/tempnameedit",   to: "temps#edit"
  get "/get_position", to: "scores#get_position"
  get "/get_synergyposition", to: "scores#get_synergyposition"
  get "/get_situationposition", to: "scores#get_situationposition"
  get "/get_kihonposition", to: "scores#get_kihonposition"
  post '/update_or_create_data', to: 'scores#update_or_create_data'
  post '/update_or_create_synergydata', to: 'scores#update_or_create_synergydata'
  post '/update_or_create_situationdata', to: 'scores#update_or_create_situationdata'
  post '/update_or_create_kihondata', to: 'scores#update_or_create_kihondata'
  post "/login", to: "sessions#create"
  post 'reset_temp', to: 'temps#reset_temp'
  post 'reset_score', to: 'scores#reset_score'
  post '/hontouroku', to: 'kategoris#create'
  resources :easyscores
  resources :scores
  resources :scoremaps
  resources :heros
  resources :users
  resources :champs
  resources :temps
  resources :metamons
  resources :templates
  resources :joukyous
  resources :kategoris
  resources :users do
    member do
      get :update_doing_temp
      get :update_editing_temp
    end
  end
  resources :scores do
    collection do
      post :create1
      post :create2
      post :create3
    end
  end
  get 'champs/:name/image', to: 'champs#show_image'
  resources :users do
    post 'set_tempting_false', on: :collection
  end
  resources :joukyous do
    post 'creation', on: :collection
    member do
      delete :destroy_edit_joukyou
    end
  end
  resources :champs do
    post 'set_tempting_true', on: :collection
    post 'set_editting_true', on: :collection
  
    member do
      delete :destroy_edit
    end
  end
  delete "/logout",  to: "sessions#destroy"
end
