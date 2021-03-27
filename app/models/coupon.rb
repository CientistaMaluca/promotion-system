class Coupon < ApplicationRecord
  belongs_to :promotion

  def self.generate(promotion)

  end
end
