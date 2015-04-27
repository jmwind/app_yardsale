module Settings
  SPAM_ENGINE_BLOG = "http://grapevine.heroku.com"
  SPAM_ENGINE_KEY  = "XXX"

  mattr_accessor :google_analytics_code
  self.google_analytics_code = "XXX"

  mattr_accessor :host
  mattr_accessor :webhook_url
  mattr_accessor :port
  mattr_accessor :email
  self.email = "official-apps@shopify.com"

  mattr_accessor :mailer_email
  self.mailer_email = "noreply@shopify.com"

  mattr_accessor :admin_email
  self.admin_email = "official-apps@shopify.com"

end
