json.extract! account, :id, :account_number, :account_type, :balance, :active, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)