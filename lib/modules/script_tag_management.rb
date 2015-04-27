module ScriptTagManagement
  def install_script_tags
    with_api_access do
      ScriptTag.find_or_create
    end
  rescue ActiveResource::ClientError => e
    self.errors.add(:base, "Error creating script tag #{e}")
    raise ActiveRecord::RecordInvalid.new(self)
  end

end
