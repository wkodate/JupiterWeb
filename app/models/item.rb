class Item < ActiveRecord::Base
  belongs_to :rss
  validates :link, presence: true
  validates :title, presence: true
end
