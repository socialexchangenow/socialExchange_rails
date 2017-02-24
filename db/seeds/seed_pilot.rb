Seed_Charities = [
  {
    name: "World Vision Canada",
    shortCode: "WVC001",
    shortDescription: "World Vision Canada",
    longDescription: "World Vision Canada",
  },
  {
    name: "World Vision USA",
    shortCode: "WVU001",
    shortDescription: "World Vision USA",
    longDescription: "World Vision USA",
  },
  {
    name: "UNICEF",
    shortCode: "UNICEF",
    shortDescription: "UNICEF",
    longDescription: "UNICEF",
  },
  {
    name: "CAMH",
    shortCode: "CAMH01",
    shortDescription: "CAMH",
    longDescription: "CAMH",
  },
]

Seed_Charity_Offers = [
  {
    charityCode: "WVC001",
    offers: [
      {
        shortCode: "SRV001",
        shortDescription: "Answer survey question",
        longDescription: "I will answer a question and promote you on social media every time I come to your establishment, if you donate $1 to World Vision Canada each time.",
        amount: 1000.00
      },
      {
        shortCode: "CF001",
        shortDescription: "Charitable Friends",
        longDescription: "I will bring at least 2 friends with me to your establishment and we will promote you on social media, if you donate $2 to World Vision Canada for each of us.",
        amount: 1000.00
      },
      {
        shortCode: "SC001",
        shortDescription: "Share a Contribution",
        longDescription: "I will donate $10 to World Vision Canada, if you double my donation.",
        amount: 1000.00
      },
      {
        shortCode: "SME001",
        shortDescription: "Social Media Xchange",
        longDescription: "I will share a selfie with at least one of your staff members on social media, if you donate $5 to World Vision Canada each time.",
        amount: 1000.00
      },
    ]
  },
]

CharityOffer.destroy_all
Charity.destroy_all

Seed_Charities.each do |charity|
  Charity.create charity
end

Seed_Charity_Offers.each do |sco|
  charity = Charity.where( shortCode: sco[ :charityCode ] ).first
  sco[ :offers ].each do |offer|
    charity_offer = CharityOffer.new offer 
    charity_offer.charity_id = charity.id
    charity_offer.save
  end
end
