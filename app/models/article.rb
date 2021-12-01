class Article < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }, presence: true
  validates :url, :imageUrl, :newsSite, :summary, :publishedAt, presence: true
end