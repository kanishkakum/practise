# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(title: 'cream cheese',
               description: 'delicious cheese for your bagel',  
               price: 3.5)

Product.create(title: 'shoe phone',
               description: 'all spies have phones in their shoe',  
               price: 89.0)

Product.create(title: 'Robot vaccum',
               description: 'cleans your floor',  
               price: 103.99)