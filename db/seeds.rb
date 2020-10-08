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

Tag.create!(
	name: '私の取り組み'
)

Goal.create!([
	{name: "1．貧困をなくそう"},
	{name: "2．飢餓をゼロ"},
	{name: "3．すべての人に健康と福祉を"},
	{name: "4．質の高い教育をみんなに"},
	{name: "5．ジェンダー平等を実現しよう"},
	{name: "6．安全な水とトイレを世界中に"},
	{name: "7．エネルギーをみんなに そしてクリーンに"},
	{name: "8．働きがいも経済成長も"},
	{name: "9．産業と技術革新の基盤をつくろう"},
	{name: "10．人や国の不平等をなくそう"},
	{name: "11．住み続けられるまちづくりを"},
	{name: "12．つくる責任 つかう責任"},
	{name: "13．気候変動に具体的な対策を"},
	{name: "14．海の豊かさを守ろう"},
	{name: "15．陸の豊かさも守ろう"},
	{name: "16．平和と公正をすべての人に"},
	{name: "17．パートナーシップで目標を達成しよう"}
	])