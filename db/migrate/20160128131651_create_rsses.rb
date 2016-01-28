class CreateRsses < ActiveRecord::Migration
  def change
    create_table :rsses do |t|
      t.string :rss_url
      t.string :title
      t.string :site_link
      t.string :description
      t.boolean :crawl

      t.timestamps null: false
    end
  end
end
