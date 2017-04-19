json.extract! customer, :id, :name, :email, :phone_number, :birth_date, :sex, :created_at, :updated_at
json.url customer_url(customer, format: :json)
