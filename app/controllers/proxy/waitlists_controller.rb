class Proxy::WaitlistsController < RemoteAreaController

  before_filter :load_or_initialize_product, :only => [:index, :product]
  #around_filter :respond_with_jsonp
  before_filter :clean_parameters

  def index


    @html = render_to_string(:template => "/proxy/waitlists/index", :formats => [:html], :layout => false, :locals => {:product_id => remote_id_param, :product_available => product_available?})
    respond_to do |format|
      format.json { render :json => {:success => true, :html => @html}, :callback => @callback }
    end
  end

  def create
  end

  def product
  end

  private

  def remote_id_param
    params.permit(:product_id)[:product_id]
  end

  def load_or_initialize_product

  end

  def clean_parameters
    @callback = params.delete(:callback)
    params.delete(:_)
  end

  def product_available?
    variants = ShopifyAPI::Product.find(remote_id_param).variants
    num = 0
    variants.each do |variant|
      num += variant.inventory_quantity
    end
    num > 0
  end

end
