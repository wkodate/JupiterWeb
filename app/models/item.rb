class Item < ActiveRecord::Base
  delegate :title, to: :rss, prefix: true, allow_nil: true
  delegate :site_link, to: :rss, prefix: true, allow_nil: true
  belongs_to :rss
  validates :link, presence: true
  validates :title, presence: true
end
