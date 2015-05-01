class BuyersController < ApplicationController

  around_filter :shopify_session
  
  def show
    @product_origin = ShopifyAPI::Product.where(id: params[:id]).first.attributes
    @product = Shop.first.products.where(remote_id: params[:product_id]).first
    @order = order_for(@product.remote_id)
    puts "ORDER FOUND!!! #{@order}"
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
  
  private
  
  def order_for(product_id)
    puts "SEARCHING FOR #{product_id}"
    orders = ShopifyAPI::Order.where(:status => "open")
    orders.each do | order |
      l = order.attributes[:line_items]
      l.each do | line |
        return order.attributes if line.attributes[:product_id].to_s == product_id
      end
    end
    return nil
  end
  
end