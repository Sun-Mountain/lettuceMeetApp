# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "user@example.com", password: "password")
10.times do |i|
  User.first.posts.create(title: "Post #{i+1}", body: "Body copy")    
end


User.create(email: "another_user@example.com", password: "password")