module ApiAccess
  def with_api_access
    ShopifyAPI::Session.temp(url, oauth_token) { yield }
  end
end