class Product < ActiveRecord::Base

  belongs_to :categories, polymorphic: true

  validates :name, :presence => true

  validates :description, :presence => true

  validates :price, :presence => true, :numericality => { greater_than_or_equal_to: 0.01 }

  validates :size, :presence => true, :numericality => { greater_than_or_equal_to: 0.01 }


  mount_uploader :images, ImagesUploader, :allow_blank => true

end
