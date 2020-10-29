class Article < ApplicationRecord
  belongs_to_active_hash :genre

  validates :genere,  :presence: true
  validates :genre_id,  numericality: {other_than: 1}
end
