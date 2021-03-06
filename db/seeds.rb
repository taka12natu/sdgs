# This d contain all the ecord creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	name: 'aaa',
	introduction: 'よろしく',
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

Tag.create!([
	{name: '私の取り組み'},
	{name: '私の提案'},
	{name: '募集/案内'}
])

Goal.create!([
	{name: "1．貧困をなくそう", image: "sdgs_icon_01.png", content: "準備中"},
	{name: "2．飢餓をゼロ", image: "sdgs_icon_02.png", content: "準備中"},
	{name: "3．すべての人に健康と福祉を", image: "sdgs_icon_03.png", content: "準備中"},
	{name: "4．質の高い教育をみんなに", image: "sdgs_icon_04.png", content: "準備中"},
	{name: "5．ジェンダー平等を実現しよう", image: "sdgs_icon_05.png", content: "準備中"},
	{name: "6．安全な水とトイレを世界中に", image: "sdgs_icon_06.png", content: "準備中"},
	{name: "7．エネルギーをみんなに そしてクリーンに", image: "sdgs_icon_07.png", content: "準備中"},
	{name: "8．働きがいも経済成長も", image: "sdgs_icon_08.png", content: "準備中"},
	{name: "9．産業と技術革新の基盤をつくろう", image: "sdgs_icon_09.png", content: "準備中"},
	{name: "10．人や国の不平等をなくそう", image: "sdgs_icon_10.png", content: "準備中"},
	{name: "11．住み続けられるまちづくりを", image: "sdgs_icon_11.png", content: "準備中"},
	{name: "12．つくる責任 つかう責任", image: "sdgs_icon_12.png", content: "準備中"},
	{name: "13．気候変動に具体的な対策を", image: "sdgs_icon_13.png", content: "準備中"},
	{name: "14．海の豊かさを守ろう", image: "sdgs_icon_14.png", content: "準備中"},
	{name: "15．陸の豊かさも守ろう", image: "sdgs_icon_15.png", content: "準備中"},
	{name: "16．平和と公正をすべての人に", image: "sdgs_icon_16.png", content: "準備中"},
	{name: "17．パートナーシップで目標を達成しよう", image: "sdgs_icon_17.png", content: "準備中"}
	])