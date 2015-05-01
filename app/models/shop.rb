class Shop < ActiveRecord::Base
  include WebhookManagement
  include ScriptTagManagement
  include ApiAccess

  cattr_accessor :current
  attr_accessor :first_install

  has_many :products, dependent: :destroy

  # Validations
  validates :url, presence: true, uniqueness: true
  validates :shop_id, uniqueness: true

  # Scopes
  scope :active,    -> { where(:status => 'active') }
  scope :cancelled,    -> { where(:status => 'cancelled') }

  def self.store(session)
    shop = self.new(url: session.url, oauth_token: session.token)
    shop.save!
    shop.url
  end

  def self.retrieve(session)
    if shop = self.where(url: session.url).first
      logger.debug "Shop.retrieve found: #{shop.url} #{shop.oauth_token}"
      ShopifyAPI::Session.new(shop.url, shop.oauth_token)
    end
  end

  def self.find_or_create_from_api(session)
    shop = Shop.where(url: session.url).first_or_initialize

    if shop.new_record? || shop.cancelled?
      remote_shop = ShopifyAPI::Shop.current

      shop.attributes = {
        :email       => remote_shop.email,
        :owner       => remote_shop.shop_owner,
        :name        => remote_shop.name,
        :shop_id     => remote_shop.id,
        :url         => session.url,
        :oauth_token => session.token
      }

      shop.first_install = true
      shop.status = 'active'

      begin
        shop.save!
      rescue ActiveRecord::RecordInvalid => e
        if e.message == 'Validation failed: Url has already been taken'
          shop = Shop.where(url: shop.url)
        else
          raise e
        end
      end

      #shop.install_webhooks
      shop.install_script_tags
    else
      shop.first_install = false
    end

    shop
  end

  def logged_in!
    self.update_attribute(:last_login_at, Time.zone.now)
  end

  def cancel
    self.api_token = nil
    self.oauth_token = nil
    self.status = 'cancelled'
    save!
  end

  def cancelled?
    self.status == "cancelled"
  end

end
