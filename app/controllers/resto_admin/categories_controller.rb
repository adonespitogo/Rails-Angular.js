class RestoAdmin::CategoriesController < RestoAdmin::BaseController
  layout false
  def index
    @categories = @branch_group.branches_categories
  end
end