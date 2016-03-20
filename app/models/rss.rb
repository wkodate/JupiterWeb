class Rss < ActiveRecord::Base
  has_many :item
  validates :rss_url, presence: true
  validates :title, presence: true
  validates :site_link, presence: true
end
