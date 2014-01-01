module CategoriesHelper

  def all_categories
    @menu_categories = Category.all
  end

end