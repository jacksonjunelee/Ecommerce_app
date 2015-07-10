# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create([{name: 'Motorcycle', price: 43.20, quantity: 5, description: "rad Motorcycle"}])
Product.create([{name: 'Bike', price: 42.10, quantity: 10, description: "4 wheel bike"}])
Product.create([{name: 'Car', price: 22.20, quantity: 0, description: "Cool Car"}])
# User.create([{username: 'Moo', firstname: 'JAckson', lastname: 'Lee'}])
