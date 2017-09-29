20.times do
  User.create!(
    email: Faker::Internet.email,
    password: 123123
  )
end

users = User.all

50.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample
  )
end


puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
