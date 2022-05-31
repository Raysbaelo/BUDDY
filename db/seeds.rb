puts "creating user..."
josie = User.create(email: "josie@hotmail.Com", nickname: "jojo", password: 'wagons')
puts "Creating tasks.."
basket = { name: "basket", category: "sport", user_id: josie.id }
actualisation =  { name: "actualisation", category: "business", user_id: josie.id }

[basket, actualisation].each do |attributes|
  task = Task.create!(attributes)
  puts "Created #{task.name}"
end
puts "Finished!"
