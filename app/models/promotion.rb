class Promotion < ApplicationRecord
  has_many :coupons
  
  validates :name, :code, :discount_rate, :coupon_quantity, 
            :expiration_date, presence: { message: 'não pode ficar em branco' }
  validates :name, :code, uniqueness: { message: 'deve ser único' }          

  def generate_coupons!
    (1..coupon_quantity).each do |number|
      Coupon.create!(code: "#{code}-#{'%04d' % number}", promotion: self)
    end
  end
end
