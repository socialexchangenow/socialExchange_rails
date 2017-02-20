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

class Business < ActiveRecord::Base
  has_many :business_counter_offers
end
