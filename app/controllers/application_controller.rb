class ApplicationController < ActionController::Base

  # XXX this is not good, fix
  #protect_from_forgery

  def api_session_for(shop)
    ShopifyAPI::Session.new(shop.url, shop.oauth_token)
  end
end
