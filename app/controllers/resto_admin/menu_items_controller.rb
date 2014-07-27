class RestoAdmin::MenuItemsController < RestoAdmin::BaseController

  include CleanPagination

  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  before_action :build_options, only: [:create, :update]

  layout false
  respond_to :json

  def index
    @menu_items =  if params[:category_id]
      @branch_group.menu_items_by_category(params[:category_id])
    else
      @branch_group.menu_items
    end

    max_per_page = 10
    paginate @menu_items.count, max_per_page do |limit, offset|
      @menu_items = @menu_items.limit(limit).offset(offset).order(:name)
    end
  end

  def create
      @item = MenuItem.new(item_params)
      @item.branch_menu_categories = branch_menu_categories
      @item.item_options = @item_options
      @item.save
      render :show
  end

  private
    def branch_menu_categories
      branch_menu_categories = []
      branch_ids.each do |b_id|
        menu_category_ids.each do |c_id|
          branch_menu_categories << BranchMenuCategory.find_or_create_by(branch_id: b_id, menu_category_id: c_id)
        end
      end
      branch_menu_categories
    end

    def item_params
      params.require(:menu_item)
      .permit(
        :slug,
        :name,
        :description,
        :price,
        :meta_keywords,
        :meta_description,
        :deleted_at
      )

    end

    def branch_ids
      (params[:menu_item][:branches] || []).map { |e| e[:id]  }
    end

    def menu_category_ids
      (params[:menu_item][:categories]  || []).map { |e| e[:id]  }
    end

    def build_options
      @item_options = []
      item_options_params.each do |item_option_params|
        item_option = ItemOption.new(
          name: item_option_params[:name],
          description: item_option_params[:description],
          option_limit: item_option_params[:option_limit]
        )
        item_option_params[:options].each do |option|
          item_option_option = ItemOptionOption.new
          item_option_option.name = option[:name]
          item_option_option.price = option[:price]
          item_option.options << item_option_option
        end
        @item_options << item_option
      end
      @item_options
    end

    def item_options_params
      params[:menu_item][:item_options] || []
    end

end
