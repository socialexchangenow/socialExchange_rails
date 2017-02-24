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

require 'test_helper'

class BusinessCounterOfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
