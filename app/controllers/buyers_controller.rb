class BuyersController < ApplicationController

  around_filter :shopify_session
  
  def show
    @product_origin = ShopifyAPI::Product.where(id: params[:id]).first.attributes
    @product = Shop.first.products.where(remote_id: params[:product_id]).first
    @buyers = @product.buyers
  end
  
  def destroy
    product = Shop.first.products.where(remote_id: params[:product_id]).first
    buyer = product.buyers.where(email: params[:email]).first
    buyer.destroy  
    redirect_to action: 'show', product_id: params[:product_id]
  end	
  
  def clear
    product = Shop.first.products.where(remote_id: params[:product_id]).first
    buyer = product.buyers.where(email: params[:email]).first
    buyer.update(:raise => 0)
    redirect_to action: 'show', product_id: params[:product_id]
  end
  
end