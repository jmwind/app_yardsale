class Admin::BuyersController < AdminAreaController
  
  before_filter :load_product
  
  def show    
    @title = params[:title] 
    @order = order_for(@product.remote_id)
    @buyers = @product.buyers
  end
  
  def destroy
    buyer = load_buyer
    buyer.destroy  
    redirect_to action: 'show', product_id: params[:product_id]
  end	
  
  def clear
    buyer = load_buyer
    buyer.update(:raise => 0)
    redirect_to action: 'show', product_id: params[:product_id]
  end
  
  private
  
  def load_product
    @product = @shop.products.where(remote_id: params[:product_id]).first
  end
  
  def load_buyer
    @product.buyers.where(email: params[:email]).first
  end
  
  def order_for(product_id)
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