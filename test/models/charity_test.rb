# == Schema Information
#
# Table name: charities
#
#  id               :integer          not null, primary key
#  name             :string
#  shortCode        :string(6)
#  shortDescription :string
#  longDescription  :string
#  contactEmail     :string
#  contactPhone     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CharityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
