class Webhooks::ProductsCreate < Webhooks::Base

  def self.topic
    'products/create'
  end

end
