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

require 'test_helper'

class IndividualOfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
