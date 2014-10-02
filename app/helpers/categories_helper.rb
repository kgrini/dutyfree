module CategoriesHelper

  def all_categories
    @menu_categories = Category.cached_categories
  end

end