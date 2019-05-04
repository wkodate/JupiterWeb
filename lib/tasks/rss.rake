require 'rss'
namespace :rss do
  desc "テスト"
  
  task :fetcher => :environment do
    # get rss urls
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
        date = item.date
        # save db
        #i = Item.new(link: link, title: title)
        Item.create!(
          link: link,
          title: title,
          date: date,
          rss_id: rss_id
        )
      end
    end
  end
end
