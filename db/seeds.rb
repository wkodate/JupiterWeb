# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rss.create!(rss_url:  "http://blog.livedoor.jp/rock1963roll/index.rdf",
             title: "RSS Title1",
             site_link: "http://blog.livedoor.jp/rock1963roll/",
            )
Rss.create!(rss_url:  "http://blog.livedoor.jp/livejupiter2/index.rdf",
             title: "RSS Title2",
             site_link: "http://blog.livedoor.jp/livejupiter2/",
            )

Item.create!(link: "http://blog.livedoor.jp/rock1963roll/archives/4603819.html",
             title: "【悲報】ホームラン、年間288本ペース",
             date: "2016-03-25 13:18:00.000000",
             image: "http://livedoor.blogimg.jp/rock1963roll/imgs/d/f/df61fec5.jpg",
             rss_id: 1,
            )

99.times do |n|
  link = Faker::Internet.url
  title = Faker::Name.title
  date = Faker::Date.between(2.years.ago, 1.years.ago)
  image = Faker::Company.logo
  rss_id = 2
  Item.create!(link: link,
               title: title,
               date: date,
               image: image,
               rss_id: 2,
              )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
