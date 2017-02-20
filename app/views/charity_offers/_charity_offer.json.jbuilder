json.extract! charity_offer, :id, :charity_id, :shortCode, :shortDescription, :longDescription, :amount, :created_at, :updated_at
json.url charity_offer_url(charity_offer, format: :json)