json.extract! business, :id, :name, :shortCode, :shortDescription, :longDescription, :contactEmail, :contactPhone, :created_at, :updated_at
json.url business_url(business, format: :json)