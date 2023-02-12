json.extract! transaction, :id, :data, :description, :value, :category, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
