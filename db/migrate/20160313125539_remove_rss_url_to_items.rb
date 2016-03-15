class RemoveRssUrlToItems < ActiveRecord::Migration
  def change
    remove_column :items, :rss_url, :string
  end
end
