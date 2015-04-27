class Shop < ActiveRecord::Base

  # Validations
  validates :url, presence: true, uniqueness: true
  validates :shop_id, presence: true, uniqueness: true

  # Scopes
  scope :active,    -> { where(:status => 'active') }
end
