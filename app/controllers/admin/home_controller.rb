class Admin::HomeController < AdminAreaController

  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:fields => [:id, :title]})
    @product_map = @products.each_with_object(Hash.new(0)) { |e, a| a["#{e.attributes[:id]}"] = e.attributes[:title] }
    @product_buyers = @shop.products
  end
 
  def destroy
    @product = @shop.products.where(remote_id: params[:product_id]).first
    @product.destroy
    redirect_to "/"
  end
  
  def help
  end

end
