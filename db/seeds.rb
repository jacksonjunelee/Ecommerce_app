# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create([{name: 'Motorcycle', price: 4320, quantity: 5, description: "rad Motorcycle", url: "http://cdn.playbuzz.com/cdn/0079c830-3406-4c05-a5c1-bc43e8f01479/7dd84d70-768b-492b-88f7-a6c70f2db2e9.jpg"}])
Product.create([{name: 'Bike', price: 4210, quantity: 10, description: "4 wheel bike", url: "http://cdn.playbuzz.com/cdn/0079c830-3406-4c05-a5c1-bc43e8f01479/7dd84d70-768b-492b-88f7-a6c70f2db2e9.jpg"}])
Product.create([{name: 'Car', price: 2220, quantity: 0, description: "Cool Car", url: "http://cdn.playbuzz.com/cdn/0079c830-3406-4c05-a5c1-bc43e8f01479/7dd84d70-768b-492b-88f7-a6c70f2db2e9.jpg"}])
# User.create([{username: 'Moo', firstname: 'JAckson', lastname: 'Lee'}])
