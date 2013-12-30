class Category < ActiveRecord::Base

  has_many :products, as: :categories, dependent: :destroy

  validates :name, :presence => true
end
