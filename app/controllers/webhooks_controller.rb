require 'base64'
require 'openssl'

class WebhooksController < ApplicationController
  before_filter :verify_webhook

  def uninstalled
    if shop = Shop.where(url: params[:domain]).first
      cancel_shop(shop)
    end
    head(:ok)
  end

 def products
    # XXX: hack, find the right store from session?
    # use HTTP_X_SHOPIFY_SHOP_DOMAIN
    product = Shop.first.products.where(remote_id: params[:id]).first
    product.update_attribute(:title, params[:title]) if product
    puts "WEBHOOK DATA ==> #{params[:id]} => #{params[:title]}"
    head(:ok)
 end

  private

  def cancel_shop(shop)
    session = ShopifyAPI::Session.new(shop.url, shop.oauth_token)
    ShopifyAPI::Base.activate_session(session)
    shop.cancel

    # XXX set as inactive and allow re-activating later
    shop.destroy
  rescue => e
  ensure
    ShopifyAPI::Base.clear_session
  end

  def verify_webhook
    request.body.rewind
    @request_data = request.body.read
    digest  = OpenSSL::Digest.new('sha256')
    calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, ShopifyAPI::Session.secret, @request_data)).strip

    #if calculated_hmac != request.env["HTTP_X_SHOPIFY_HMAC_SHA256"]
    #  Airbrake.notify(
    #    :error_class   => "WebhookError",
    #    :error_message => "WebhookError: invalid HTTP_X_SHOPIFY_HMAC_SHA256"
    #  )
      # This will stop the request and the method won't be called
    #  head(:ok)
    #end
  end
end
