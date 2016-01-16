friends = ["Diego", "Liam", "Gloria", "Yu", "Rusty"]

friends.each do |friend|
  puts "#{friend} is now online!"
end

puts
puts "----- Another way of doing this 1-line -----"
puts

friends.each { |friend| puts "#{friend} is now online!" }

puts

hashbrown = { meal: "burger", drink: "coke", side: "fries", dessert: "ice cream" }
# Iterate over the hash
hashbrown.each { |key, value| puts "#{key} choice: #{value}" }

puts

nums = [10, 15, 20, 25, 35, 40]
counter = 0
while counter < nums.length
 puts nums[counter] * nums[counter]
 counter = counter + 1
end

puts

friends = [
  {
    name: "Diego",
    status: "Online"
  },
  {
    name: "Liam",
    status: "Away"
  },
  {
    name: "Gloria",
    status: "Online"
  },
  {
    name: "Charlie",
    status: "Away"
  }
]

friends.each do |friend|
  puts "#{friend[:name]} is #{friend[:status]}"
end

# online_friends = []
# friends.each do |friend|
#   if friend[:status] == "Online"
#     online_friends.push friend
#   end
# end

online_friends = friends.select do |friend|
  friend[:status] == "Online"
end

# online_friends = friends.select{|friend| friend[:status] == "Online"}


puts
puts

online_friends.each do |onlineFriend|
  puts "#{onlineFriend[:name]} is #{onlineFriend[:status]}"
end

nums = [1,2,3,4,5]
double_arr = nums.map {|num| num * 2}

yelling_friends = friends.map {|friend| friend[:name].upcase }

everyone_is_online = friends.map do |friend|
    {name: friend[:name], status: "Online"}
end
