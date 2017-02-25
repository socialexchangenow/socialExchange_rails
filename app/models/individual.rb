# == Schema Information
#
# Table name: individuals
#
#  id         :integer          not null, primary key
#  source     :string(3)
#  sourceID   :string
#  firstName  :string
#  lastName   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Individual < ActiveRecord::Base
  has_many :commitments
  validates :source, length: { maximum: 3 }
end
