class SalesRule < ActiveRecord::Base

  validates :description, :presence => true
end
