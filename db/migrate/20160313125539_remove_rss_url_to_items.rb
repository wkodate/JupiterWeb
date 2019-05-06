class RemoveRssUrlToItems < ActiveRecord::Migration[4.2]
  def change
    remove_column :items, :rss_url, :string
  end
end
