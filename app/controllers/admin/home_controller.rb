class Admin::HomeController < AdminAreaController

  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:fields => [:id, :title]})
    @product_map = @products.each_with_object(Hash.new(0)) { |e, a| a["#{e.attributes[:id]}"] = e.attributes[:title] }
    @product_buyers = @shop.products.includes(:buyers).where.not(:buyers => { :product_id => nil })
    @total_inventory = inventory_total
  end
 
  def destroy
    @product = @shop.products.where(remote_id: params[:product_id]).first
    @product.destroy
    redirect_to "/"
  end
  
  def help
  end
  
  def inventory_total
    total = 0.00
    products = ShopifyAPI::Product.all
    products.each do | product |
      variants = product.attributes[:variants]
      variants.each do | variant |
        total +=  variant.attributes[:price].to_d
      end
    end
    total
  end

end
