class Item < ActiveRecord::Base
    belongs_to :rss
    validates :description, length: { maximum: 140 }
end
