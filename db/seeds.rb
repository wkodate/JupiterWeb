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

99.times do |n|
  link = Faker::Internet.url
  title = Faker::Name.title
  description = Faker::Lorem.sentence
  date = Faker::Date.between(7.days.ago, Date.today)
  image = Faker::Company.logo
  Item.create!(link: link,
               title: title,
               description: description,
               date: date,
               image: image,
              )
end
