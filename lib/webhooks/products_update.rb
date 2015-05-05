class Webhooks::ProductsUpdate < Webhooks::Base

  def self.topic
    'products/update'
  end

end
