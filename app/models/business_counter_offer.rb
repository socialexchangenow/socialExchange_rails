class BusinessCounterOffer < ActiveRecord::Base
  belongs_to :business
  belongs_to :charity_offer
end
