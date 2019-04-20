class AddRssIdToItems < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :rss_id, :int, :after => :rss_url
  end
end
