EmbededApp::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    get 'auth/shopify/callback' => :show
  end

  #
  # Admin
  #
  delete 'form_page' => 'home#destroy'
  root :to => 'home#index'  
  resource :buyers do
    post :clear, on: :member
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
