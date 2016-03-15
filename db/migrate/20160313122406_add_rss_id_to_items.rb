class AddRssIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :rss_id, :int, :after => :rss_url
  end
end
