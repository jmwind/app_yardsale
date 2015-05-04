module ScriptTag

  def self.src
    "#{Settings.host}" + "/assets/yard_sale.js"
  end

  def self.find_or_create
    if script_tag
      script_tag
    else
      Rails.logger.info("[ShopifyAPI] === creating ScriptTag for #{src}")
      tag = ShopifyAPI::ScriptTag.create({:src => src, :event => 'onload'})
      Rails.logger.info("[ShopifyAPI] === script tag created #{tag.inspect}")
      if tag.new?
        Rails.logger.info("[ShopifyAPI] === Error creating scripttag #{tag.errors.full_messages.to_sentence}")
        raise ActiveResource::ResourceInvalid, tag.errors.full_messages.to_sentence
      end
      tag
    end
  end

  def self.script_tag
    ShopifyAPI::ScriptTag.find(:all, :params => {:src => src}).first
  end
end
