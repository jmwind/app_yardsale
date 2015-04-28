class ApplicationController < ActionController::Base
  #protect_from_forgery

  def api_session_for(shop)
    ShopifyAPI::Session.new(shop.url, shop.oauth_token)
  end
end
