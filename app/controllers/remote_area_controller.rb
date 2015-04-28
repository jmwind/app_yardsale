class RemoteAreaController < ApplicationController
  layout nil

  before_filter :load_shop
  around_filter :set_active_resource

  def load_shop
    @shop = load_shop_from_shop_param
    raise ShopMissingError unless @shop
    Shop.current = @shop
  end

  def require_active_shop
    raise ShopInactiveError unless @shop.active?
  end

  def set_active_resource
    apisession = api_session_for(@shop)
    ShopifyAPI::Base.activate_session(apisession)
    yield
  ensure
    ShopifyAPI::Base.clear_session
  end

  def load_shop_from_shop_param
    url = params[:shop]
    return if url.blank?
    if shop = Shop.where(url: url).first
      logger.info("[REMOTE] Shop URL from params #{shop.url}")
      shop
    end
  end

end
