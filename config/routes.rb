EmbededApp::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end

  #
  # Admin
  #
  root :to => 'home#index'  
  resource :buyers

  #
  # API
  #
  namespace :proxy do
    resources :waitlists, :only => [:index, :create] do
        get :product,  :on => :collection
    end
  end

  # webhook app/uninstall
  match '/webhooks/app/uninstalled' => 'webhooks#uninstalled', :via => :post
end
