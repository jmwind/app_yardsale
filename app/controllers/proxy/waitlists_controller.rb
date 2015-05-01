class Proxy::WaitlistsController < RemoteAreaController

  before_filter :load_or_initialize_product, :only => [:index, :product, :create]
  before_filter :clean_parameters

  def index
    @html = render_to_string(
      :template => "/proxy/waitlists/index",
      :formats => [:html], :layout => false,
      :locals => {:shop => @shop, :product_id => remote_id_param,
                  :product => @product, :product_available => product_available})
    respond_to do |format|
      format.json { render :json => {:success => true, :html => @html}, :callback => @callback }
    end
  end

  def create
    # add validation that this buyer doesn't exist already and return proper error
    if @product.buyers.where(email: params["email"]).present?
      render :status => :conflict, :text => "This e-mail address is already in the waiting list." and return
    end    
    @buyer = @product.buyers.build
    @buyer.name = params["name"]
    @buyer.email = params["email"]
    @buyer.raise = params["raise"]
    @buyer.save!
    respond_to do |format|
        format.html { render :nothing => true }
        format.js
    end    
  end

  def product
  end

  private

  def remote_id_param
    params.permit(:product_id, :shop)[:product_id]
  end

  def load_or_initialize_product
    if @product = @shop.products.where(remote_id: remote_id_param).first_or_create
      logger.info("[REMOTE] Product ID from params #{@product.remote_id}")
      @product
    end
  end

  def clean_parameters
    @callback = params.delete(:callback)
    params.delete(:_)
  end

  def product_available
    # XXX Cache and use webhooks to keep inventory numbers for each product
    variants = ShopifyAPI::Product.find(remote_id_param).variants
    num = 0
    variants.each do |variant|
      q = variant.inventory_quantity
      num += q
    end
    num
  end

end
