class Promotion < ApplicationRecord
  has_many :coupons
  
  validates :name, :code, :discount_rate, :coupon_quantity, 
            :expiration_date, presence: { message: 'não pode ficar em branco' }
  validates :name, :code, uniqueness: { message: 'deve ser único' }          
 
  def generate_coupons!
    return if coupons.any?

    (1..coupon_quantity).each do |number|
      coupons.create!(code: "#{code}-#{'%04d' % number}", promotion: self)
    end
  end

  # TODO: fazer testes para esse método
  def coupons?
    coupons.any?
  end
end