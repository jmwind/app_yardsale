class Webhooks::Base

  def self.find_or_create
    if hook
      hook
    else
      webhook = ShopifyAPI::Webhook.create(
          :topic   => topic,
          :format  => 'json',
          :address => "http://localhost:3000/webhooks/#{topic}")

      raise ActiveResource::ResourceInvalid, "#{webhook.errors.full_messages.inspect}" if webhook.new?
      webhook
    end
  end

  def self.exists?
    hook.present?
  end

  def self.hook
    ShopifyAPI::Webhook.find(:first, :params => {:topic => topic, :address => "http://localhost:3000/webhooks/#{topic}"})
  rescue
  end

end
