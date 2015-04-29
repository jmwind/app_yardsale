class Product < ActiveRecord::Base
  has_many :buyers, dependent: :destroy

  validates :remote_id,  presence: true
end
