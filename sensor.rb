require 'json'
require 'csv'
policy = JSON.parse(File.read("policy.json")).invert
action = JSON.parse(File.read("action.json"))

def apply_policy(policy, value)
  policy.each do |k,v|
    # Compare to value ranges
    if value >= k[0] && value <= k[1]
      return v
    end
  end
end

# Read in sensor data
CSV.open("sensor_data.csv").each do |date, value|
  puts "\nReading data..."
  value = value.to_i
  # Apply Grades
  grade = apply_policy(policy, value)
  
  # Post the pH value and the grade to a website.
  # Agencies can subscribe to get notifications.
  p [value, grade]

  # Determine actions to be taken.
  actions = action[grade]

  p actions
end