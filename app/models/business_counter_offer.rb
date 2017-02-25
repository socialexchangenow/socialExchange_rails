# == Schema Information
#
# Table name: business_counter_offers
#
#  id               :integer          not null, primary key
#  business_id      :integer
#  charity_offer_id :integer
#  shortCode        :string(6)
#  shortDescription :string
#  longDescription  :string
#  amount           :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class BusinessCounterOffer < ActiveRecord::Base
  validates :shortCode, length: { maximum: 6 }
  belongs_to :business
  belongs_to :charity_offer
  has_many :commitments
end
