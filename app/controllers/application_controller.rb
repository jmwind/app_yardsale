class ApplicationController < ActionController::Base

  def api_session_for(shop)
    ShopifyAPI::Session.new(shop.url, shop.oauth_token)
  end
end
