require 'rss'
namespace :rss do
  desc "fetch rsses and parse items"
  task :fetch => :environment do
    rsses = Rss.all
    rsses.each do |r|
      rss_id = r.id
      rss_url = r.rss_url

      # fetch
      # https://docs.ruby-lang.org/ja/latest/library/rss.html
      rss_source = URI.parse(rss_url)
      rss = nil
      begin
        rss = RSS::Parser.parse(rss_source)
      rescue RSS::InvalidRSSError
        rss = RSS::Parser.parse(rss_source, false)
      end

      # parse
      rss.items.each do |item|
        link =  item.link
        title = item.title
        image = ""
        date = item.date
        Item.where(link: link).first_or_create(
          title: title,
          date: date,
          image: image,
          rss_id: rss_id,
        )
      end
    end
  end

  desc "delete items 7 days ago"
  task :delete => :environment do
    Item.where(['date < ?', 7.days.ago]).destroy_all
  end

end
