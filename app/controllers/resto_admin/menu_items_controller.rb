class RestoAdmin::MenuItemsController < RestoAdmin::BaseController

  layout false

  def index
    @menu_items = @branch_group.menu_items.paginate(page: params[:page])
  end

end
