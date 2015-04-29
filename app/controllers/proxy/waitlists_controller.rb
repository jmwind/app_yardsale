class Proxy::WaitlistsController < RemoteAreaController

  before_filter :load_or_initialize_product, :only => [:index, :product]
  before_filter :clean_parameters

  def index
    @html = render_to_string(:template => "/proxy/waitlists/index", :formats => [:html], :layout => false, :locals => {:shop => @shop, :product_id => remote_id_param, :product_available => product_available})
    respond_to do |format|
      format.json { render :json => {:success => true, :html => @html}, :callback => @callback }
    end
  end

  def create
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
      num += q < 0 ? 1 : q
    end
    logger.info("[REMOTE] Product inventory #{num} for #{variants.count}")
    num
  end

end
