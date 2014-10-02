class Category < ActiveRecord::Base

  has_many :products, as: :categories, dependent: :destroy

  validates :name, :presence => true

  def self.cached_find(id)
    Rails.cache.fetch([name, id], expires_in: 5.minutes) { find(id) }
  end

  def self.cached_categories
    Rails.cache.fetch([name, id], expires_in: 5.minutes) { all.to_a }
  end
end
