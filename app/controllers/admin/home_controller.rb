class Admin::HomeController < AdminAreaController

  def index
    @shop.update_stats
    @product_buyers = @shop.products.includes(:buyers).where.not(:buyers => { :product_id => nil })
  end
 
  def destroy
    @product = @shop.products.where(remote_id: params[:product_id]).first
    @product.destroy if @product
    redirect_to "/"
  end
  
  def help
  end
  
  def send
  end
  
end
