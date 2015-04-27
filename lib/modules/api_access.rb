module ApiAccess
  def with_api_access
    puts "API ACCESS #{url}:#{oauth_token}"
    ShopifyAPI::Session.temp(url, oauth_token) { yield }
  end
end
