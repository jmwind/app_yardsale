EmbededApp::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end

  #
  # Admin
  #
  scope module: 'admin' do
    get 'help' => 'home#help'
    delete 'product' => 'home#destroy'
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
end
