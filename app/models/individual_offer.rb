# == Schema Information
#
# Table name: individual_offers
#
#  id               :integer          not null, primary key
#  individual_id    :integer
#  charity_offer_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class IndividualOffer < ActiveRecord::Base
  belongs_to :individual
  belongs_to :charity_offer
end
