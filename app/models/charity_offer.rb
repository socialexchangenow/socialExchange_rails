# == Schema Information
#
# Table name: charity_offers
#
#  id               :integer          not null, primary key
#  charity_id       :integer
#  shortCode        :string(6)
#  shortDescription :string
#  longDescription  :string
#  amount           :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CharityOffer < ActiveRecord::Base
  belongs_to :charity
  has_many :business_counter_offers
  has_many :commitments
  has_many :individual_offers
end
