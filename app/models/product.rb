class Product < ActiveRecord::Base
  has_many :buyers, dependent: :destroy

  validates :remote_id,  presence: true
  
  before_create :sync_attributes
  
  def sync_attributes
    product = ShopifyAPI::Product.find(self.remote_id)
    return unless product
    self.title = product.title
  end
  
  def num_raises
    decimal_field = Buyer.arel_table[:raise]
    buyers.where(decimal_field.gt(0)).count
  end
end
