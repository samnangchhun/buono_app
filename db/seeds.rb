require 'faker'

puts 'seeding 5 users...'

User.create(email: fra@mail.com, password: '123456')
User.create(email: mich@mail.com, password: '123456')
User.create(email: sam@mail.com, password: '123456')
User.create(email: edo@mail.com, password: '123456')
User.create(email: lara@mail.com, password: '123456')

puts 'users created'

puts 'seeding 20 ingredients...'

20.times do
  Ingredient.create(name: Faker::Food.ingredient)
end
