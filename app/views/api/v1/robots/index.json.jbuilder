json.array!(@robots) do |robot|
  json.extract! robot, :id, :name, :user_id, :age, :type, :victory_rate
  json.url robot_url(robot, format: :json)
end
