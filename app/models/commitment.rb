class Commitment < ActiveRecord::Base
  belongs_to :individual
  belongs_to :charity_offer
  belongs_to :business_counter_offer
end
