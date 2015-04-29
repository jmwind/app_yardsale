class Buyer < ActiveRecord::Base
  belongs_to :product

  validates :email, presence: true
  validates :name, presence: true

end
