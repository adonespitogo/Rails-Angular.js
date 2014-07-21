class RestoAdmin::MenuItemsController < RestoAdmin::BaseController

  include CleanPagination

  layout false

  def index
    @menu_items =  if params[:category_id]
      @branch_group.menu_items_by_category(params[:category_id])
    else
      @branch_group.menu_items
    end

    max_per_page = 10
    paginate @menu_items.count, max_per_page do |limit, offset|
      @menu_items = @menu_items.limit(limit).offset(offset)
    end
  end

end
