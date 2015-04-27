class Webhooks::AppUninstall < Webhooks::Base

  def self.topic
    'app/uninstalled'
  end

end
