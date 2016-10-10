# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@whatsgood.com', password: 'happypuppy', password_confirmation: 'happypuppy')
Settings.create!(var:'splashTitle', value:'Brace Yourself!', thing_type:'string')
Settings.create!(var:'splashSubtitle', value:'sakdl sald jsla ald asld jkals kasl ksa', thing_type:'string')
Settings.create!(var:'facebook', value:'whatsgood', thing_type:'string')
Settings.create!(var:'twitter', value:'whatsgood', thing_type:'string')
Settings.create!(var:'pinterest', value:'whatsgood', thing_type:'string')
Settings.create!(var:'instagram', value:'whatsgood', thing_type:'string')