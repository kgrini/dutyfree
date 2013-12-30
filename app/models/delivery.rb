class Delivery < ActiveRecord::Base

  validates :description, :presence => true
end
