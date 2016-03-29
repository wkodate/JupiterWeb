# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now
            )

Rss.create!(rss_url:  "http://blog.livedoor.jp/rock1963roll/index.rdf",
             title: "RSS Title1",
             site_link: "http://blog.livedoor.jp/rock1963roll/",
             description: "This is RSS sample",
            )
Rss.create!(rss_url:  "http://blog.livedoor.jp/livejupiter2/index.rdf",
             title: "RSS Title2",
             site_link: "http://blog.livedoor.jp/livejupiter2/",
             description: "Hello, RSS",
            )

Item.create!(link: "http://blog.livedoor.jp/rock1963roll/archives/4603819.html",
             title: "【悲報】ホームラン、年間288本ペース",
             description: "引用元: http://www.logsoku.com/r/2ch.sc/livejupiter/1458906616/1: 風吹けば名無し＠＼(^o^)／ 投稿日：2016/03/25(金) 20:50:16.65 ID:vxJyx7aN0.n 異常や・・・異常やで・・・ 2: 風吹けば名無し＠＼(^o^)／ 投稿日：2016/03/25(金) 20:50:28.40 ID:vxJyx7aN0.n 明ら...",
             date: "2016-03-25 13:18:00.000000",
             image: "",
             rss_id: 1,
            )

99.times do |n|
  link = Faker::Internet.url
  title = Faker::Name.title
  description = Faker::Lorem.sentence
  date = Faker::Date.between(2.years.ago, 1.years.ago)
  image = Faker::Company.logo
  rss_id = 2
  Item.create!(link: link,
               title: title,
               description: description,
               date: date,
               image: image,
               rss_id: 2,
              )
end
