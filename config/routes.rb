IcApp::Application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end

  namespace :users do
    get 'omniauth_callbacks/vkontakte'
  end

  get 'home/index' => 'home#index', :as => 'home'
  get 'home/about' => 'home#about', :as => 'about'
  get '/catalog' => "home#catalog", :as => 'catalog'

  resources :comments, :order_states, :brands, :flash_message_states

  resources :orders, only: [:index]
  resources :products do
    collection { post :import }
    resources :prod_images
  end
  netzke "/netzke", controller: :admin
  resources :user_tracings
  resources :flash_messages
  get "errors/error_404", :as => "error404"
  get "errors/error_403", :as => "error403"
  resources :roles
  resources :user_themes
  resources :regions
  resources :towns, :except => [:index, :destroy, :edit, :show, :create, :new, :update] do
    get :autocomplete_town_accent_city, :on => :collection
    collection do
      get "admin_tw"
      get "tw_dist"
    end
  end

  resources :countries do
    resources :towns do
    end
    member do
      get 'ap_show'
      get 'ap_show_ajax'
      post 'ap_show_ajax'
      get 'tw_show'
      get 'al_show'
    end
    collection do
    end
  end

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :registrations => "users/registrations",
    :confirmations => "users/confirmations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  devise_scope :user do
    root :to => "home#index"
    get "sign_in", :to => "users/sessions#new"
    get "users/sign_out", :to => "users/sessions#destroy"
    delete "users/sign_out", :to => "users/sessions#destroy"
  end
  scope "/admin" do
    resources :users do
      resources :orders do
        resources :order_histories
      end
    end
  end
#  get "/*other" => redirect("/errors/error_404")
end
