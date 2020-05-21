# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Category.create!([
    {kind: "Multi Rotor Drone"},
    {kind: "Fixed Wing Drone"},
    {kind: "Single Rotor Helicopter"},
    {kind: "Fixed Wing Hybrid"}
  ])

User.create!([
  {email: "user1@gmail.com", password: "123456", password_confirmation: "123456"},
  {email: "user2@hoti.com", password: "123456", password_confirmation: "123456"},
  {email: "user3@hotmail.com", password: "123456", password_confirmation: "123456"}
])



for i in 1..10
    User.last.listings.create(
        title: "Drone#{i}",
        description: " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus in massa tempor nec feugiat nisl pretium fusce id. Egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Lectus proin nibh nisl condimentum id. Purus sit amet volutpat consequat mauris. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed. Sit amet consectetur adipiscing elit ut aliquam purus sit amet. Ullamcorper malesuada proin libero nunc consequat interdum varius. Bibendum neque egestas congue quisque egestas diam in",
        price: rand(5000),
        category_id: 1,
        in_stock: true
    )
end

for i in 1..10
    User.first.listings.create(
        title: "Drone#{i}",
        description: " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus in massa tempor nec feugiat nisl pretium fusce id. Egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Lectus proin nibh nisl condimentum id. Purus sit amet volutpat consequat mauris. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed. Sit amet consectetur adipiscing elit ut aliquam purus sit amet. Ullamcorper malesuada proin libero nunc consequat interdum varius. Bibendum neque egestas congue quisque egestas diam in",
        price: rand(5000),
        category_id: 2,
        in_stock: true
    )
end