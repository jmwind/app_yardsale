module WebhookManagement
  def install_webhooks
    with_api_access do
      Webhooks::AppUninstall.find_or_create
      Webhooks::ProductsCreate.find_or_create
      Webhooks::ProductsUpdate.find_or_create
      Webhooks::ProductsDelete.find_or_create
    end
  rescue ActiveResource::ClientError => e
    self.errors.add(:base, "Error creating app webhook #{e}")
    raise ActiveRecord::RecordInvalid.new(self)
  end
end
