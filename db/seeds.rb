# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

while Offer.count < 10
    if !Offer.pluck(:title).include?(Faker::Job.title)
    unique_title = Faker::Job.title
    Offer.create(title: unique_title)
    end
   end
