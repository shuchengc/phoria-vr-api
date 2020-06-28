# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([
  { name: 'vr1', 'description': 'vr1 test', price: 120.0, imageUrl: 'https://picsum.photos/360/480' },
  { name: 'vr2', 'description': 'vr2 test', price: 220.0, imageUrl: 'https://picsum.photos/360/480' },
  { name: 'vr3', 'description': 'vr3 test', price: 180.0, imageUrl: 'https://picsum.photos/360/480' }
])
