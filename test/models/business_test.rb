# == Schema Information
#
# Table name: businesses
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

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
