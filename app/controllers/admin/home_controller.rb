class Admin::HomeController < AdminAreaController

  def index
    @shop.update_stats
    @product_buyers = @shop.products.includes(:buyers).where.not(:buyers => { :product_id => nil })
  end
 
  def destroy
    @product = @shop.products.where(remote_id: params[:product_id]).first
    @product.destroy if @product
    respond_to do |format|
      format.html { redirect_to "/" }
      format.js
    end
  end
  
  def help
  end
    
end
