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
	affiliation: :other
)

User.create!(
	name: 'sss',
	email: 'sss@sss',
	password: 'ssssss',
	affiliation: :other
)

User.create!(
	name: 'ddd',
	email: 'ddd@ddd',
	password: 'dddddd',
	affiliation: :individual
)

Admin.create!(
	email: ENV['ADDRESS'],
	password: ENV['PASSWORD']
)

Tag.create!(
	name: '私の取り組み'
)

Goal.create!([
	{name: "1．貧困をなくそう", image: open("./app/assets/images/sdgs_icon_01.png")},
	{name: "2．飢餓をゼロ", image: open("./app/assets/images/sdgs_icon_02.png")},
	{name: "3．すべての人に健康と福祉を", image: open("./app/assets/images/sdgs_icon_03.png")},
	{name: "4．質の高い教育をみんなに", image: open("./app/assets/images/sdgs_icon_04.png")},
	{name: "5．ジェンダー平等を実現しよう", image: open("./app/assets/images/sdgs_icon_05.png")},
	{name: "6．安全な水とトイレを世界中に", image: open("./app/assets/images/sdgs_icon_06.png")},
	{name: "7．エネルギーをみんなに そしてクリーンに", image: open("./app/assets/images/sdgs_icon_07.png")},
	{name: "8．働きがいも経済成長も", image: open("./app/assets/images/sdgs_icon_08.png")},
	{name: "9．産業と技術革新の基盤をつくろう", image: open("./app/assets/images/sdgs_icon_09.png")},
	{name: "10．人や国の不平等をなくそう", image: open("./app/assets/images/sdgs_icon_10.png")},
	{name: "11．住み続けられるまちづくりを", image: open("./app/assets/images/sdgs_icon_11.png")},
	{name: "12．つくる責任 つかう責任", image: open("./app/assets/images/sdgs_icon_12.png")},
	{name: "13．気候変動に具体的な対策を", image: open("./app/assets/images/sdgs_icon_13.png")},
	{name: "14．海の豊かさを守ろう", image: open("./app/assets/images/sdgs_icon_14.png")},
	{name: "15．陸の豊かさも守ろう", image: open("./app/assets/images/sdgs_icon_15.png")},
	{name: "16．平和と公正をすべての人に", image: open("./app/assets/images/sdgs_icon_16.png")},
	{name: "17．パートナーシップで目標を達成しよう", image: open("./app/assets/images/sdgs_icon_17.png")}
	])