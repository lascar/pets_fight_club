json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :user_id, :age, :type, :victory_rate
  json.url pet_url(pet, format: :json)
end
