Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopify,
    ShopifyApp.configuration.api_key,
    ShopifyApp.configuration.secret,

    # Permission scopes - see http://docs.shopify.com/api/tutorials/oauth for full listing
    scope: 'read_orders,write_orders,read_products,write_script_tags,read_script_tags,read_themes',
    myshopify_domain: ShopifyApp.configuration.myshopify_domain.presence || "myshopify.com",
    setup: lambda {|env|
             params = Rack::Utils.parse_query(env['QUERY_STRING'])
             site_url = "https://#{params['shop']}"
             env['omniauth.strategy'].options[:client_options][:site] = site_url
           }
end
