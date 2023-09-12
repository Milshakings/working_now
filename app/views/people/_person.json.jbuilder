json.extract! person, :id, :name, :age, :city, :created_at, :updated_at
json.url person_url(person, format: :json)
