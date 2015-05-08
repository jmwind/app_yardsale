EmbededApp::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end

  #
  # Admin
  #
  scope module: 'admin' do
    get 'product' => 'home#index'
    delete 'product' => 'home#destroy'
    get 'help' => 'home#help'
    post 'send' => 'home#send'    
    root :to => 'home#index'  
    resource :buyers do
      post :clear, on: :member
    end
  end
  
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
  match '/webhooks/products/update' => 'webhooks#products', :via => :post
  match '/webhooks/products/create' => 'webhooks#products', :via => :post
  match '/webhooks/products/delete' => 'webhooks#products', :via => :post
end
