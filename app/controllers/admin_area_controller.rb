class AdminAreaController < ApplicationController
	around_filter :shopify_session
	before_filter :configure_view_path
	before_filter :load_shop

	def configure_view_path
      prepend_view_path "app/views/admin"
  	end
	  
	def load_shop
	  current_shop = ShopifyAPI::Shop.current
	  @shop = Shop.where(:url => current_shop.attributes[:domain]).first	
	  raise ShopMissingError unless @shop
	end
end