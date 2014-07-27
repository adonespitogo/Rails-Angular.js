class RestoAdmin::MenuCategoriesController < RestoAdmin::BaseController

  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  respond_to :json
  layout false

  def index
    @categories = @branch_group.branches_categories
  end

  def create
    @category = MenuCategory.create(category_params)
    @branch_group.branches.each do |branch|
      BranchMenuCategory.create(branch_id: branch.id, menu_category_id: @category.id)
    end
    render :show
  end

  private
    def category_params
      params.permit(:name, :slug, :meta_keywords, :meta_description)
    end
end