json.extract! charity, :id, :name, :shortCode, :shortDescription, :longDescription, :contactEmail, :contactPhone, :created_at, :updated_at
json.url charity_url(charity, format: :json)