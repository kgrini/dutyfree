class Stock < ActiveRecord::Base

  validates :description, :presence => true

  mount_uploader :images, ImagesUploader
end
