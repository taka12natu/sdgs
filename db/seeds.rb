# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	name: 'aaa',
	email: 'aaa@aaa',
	password: 'aaaaaa',
	category: :other
)

User.create!(
	name: 'sss',
	email: 'sss@sss',
	password: 'ssssss',
	category: :other
)

Admin.create!(
	email: 'aaa@aaa',
	password: 'aaaaaa'
)