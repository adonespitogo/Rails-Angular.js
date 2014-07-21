class RestoAdmin::MenuItemsController < RestoAdmin::BaseController

  layout false

  def index
    @menu_items =  if params[:category_id]
      @branch_group.menu_items_by_category(params[:category_id])
    else
      @branch_group.menu_items
    end
    .paginate(page: params[:page])
  end

end
