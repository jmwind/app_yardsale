class Webhooks::ProductsDelete < Webhooks::Base

  def self.topic
    'products/delete'
  end

end
