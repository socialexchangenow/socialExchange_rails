# == Schema Information
#
# Table name: commitments
#
#  id                        :integer          not null, primary key
#  individual_id             :integer
#  charity_offer_id          :integer
#  business_counter_offer_id :integer
#  expectedDate              :datetime
#  fulfilled                 :boolean
#  fulfilledDate             :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Commitment < ActiveRecord::Base
  belongs_to :individual
  belongs_to :charity_offer
  belongs_to :business_counter_offer
end
