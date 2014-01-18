class Product < ActiveRecord::Base

  belongs_to :categories, polymorphic: true


  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :presence => true

  validates :description, :presence => true

  validates :price, :presence => true, :numericality => { greater_than_or_equal_to: 0.01 }

  validates :size, :presence => true, :numericality => { greater_than_or_equal_to: 0.01 }


  mount_uploader :images, ImagesUploader, :allow_blank => true


  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, "Line items present")
      return false
    end
  end


end
