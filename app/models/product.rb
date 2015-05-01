class Product < ActiveRecord::Base
  has_many :buyers, dependent: :destroy

  validates :remote_id,  presence: true
  
  def num_raises
    decimal_field = Buyer.arel_table[:raise]
    buyers.where(decimal_field.gt(0)).count
  end
end
