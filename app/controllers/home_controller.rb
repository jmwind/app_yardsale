class HomeController < ApplicationController

  around_filter :shopify_session

  def index
    @products = ShopifyAPI::Product.all
    @product_map = @products.each_with_object(Hash.new("not found")) { |e, a| a["#{e.attributes[:id]}"] = e.attributes[:title] }
    # XXX find the right shop, not the first!!!
    @product_buyers = Shop.first.products
  end
 
  def destroy
    @product = Shop.first.products.where(remote_id: params[:product_id]).first
    @product.destroy
    redirect_to "/"
  end

end
