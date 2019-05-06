class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.string :link
      t.string :title
      t.text :description
      t.datetime :date
      t.string :image
      t.string :rss_url

      t.timestamps null: false
    end
  end
end
