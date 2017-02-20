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

require 'test_helper'

class CommitmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
