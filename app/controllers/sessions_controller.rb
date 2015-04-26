class SessionsController < ApplicationController
  layout :false

  def new
    authenticate if params[:shop]
  end

  def show
    if response = request.env['omniauth.auth']
      sess = ShopifyAPI::Session.new(params[:shop], response['credentials']['token'])
      session[:shopify] = ShopifySessionRepository.store(sess)
      flash[:notice] = "Logged in"
      redirect_to return_address
    else
      flash[:error] = "Could not log in to Shopify store."
      redirect_to :action => 'new'
    end
  end

  protected

  def authenticate
    #
    # Instead of doing a backend redirect we need to do a javascript redirect
    # here. Open the app/views/commom/iframe_redirect.html.erb file to understand why.
    #
    if shop_name = sanitize_shop_param(params)
      @redirect_url = "/auth/shopify?shop=#{shop_name}"
      render "/common/iframe_redirect", :format => [:html], layout: false
    else
      redirect_to return_address
    end
  end

  def return_address
    session[:return_to] || root_url
  end

  def sanitize_shop_param(params)
    return unless params[:shop].present?
    return unless domain = ShopifyApp.configuration.myshopify_domain.presence || "myshopify.com"

    name = params[:shop].to_s.strip
    name += ".#{domain}" if !name.include?(domain) && !name.include?(".")
    name.sub!(%r|https?://|, '')

    u = URI("http://#{name}")
    u.host.ends_with?(".#{domain}") ? u.host : nil
  end
end
