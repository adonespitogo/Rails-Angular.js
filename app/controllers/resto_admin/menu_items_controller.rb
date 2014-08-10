class RestoAdmin::MenuItemsController < RestoAdmin::BaseApiController

  include CleanPagination

  before_action :build_options, only: [:create, :update]

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
      @item.image = decode_image
      @item.branch_menu_categories = branch_menu_categories
      @item.item_options = @item_options
      @item.save
      render :show
  end

  def update
      @item = MenuItem.find(params[:id])
      @item.image = decode_image if decode_image
      @item.branch_menu_categories = branch_menu_categories
      @item.item_options = @item_options
      @item.save
      render :show
  end

  def show
    @item = MenuItem.find(params[:id])
  end

  def destroy
    MenuItem.find(params[:id]).delete
    render nothing: true, status: 204
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
      @ip = params
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
      (params[:branches] || []).map { |e| e[:id]  }
    end

    def menu_category_ids
      (params[:categories]  || []).map { |e| e[:id]  }
    end

    def build_options
      @item_options = []
      item_options_params.each do |item_option_params|
        item_option = ItemOption.new(
          name: item_option_params[:name],
          description: item_option_params[:description],
          option_limit: item_option_params[:option_limit]
        )
        (item_option_params[:options]||[]).each do |option|
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
      params[:item_options] || []
    end

    def decode_image
      # decode base64 string
      if params[:image][:imageData] && params[:image][:imageContent] && params[:image][:imagePath]
        Rails.logger.info 'decoding now'
        decoded_data = Base64.decode64(params[:image][:imageData]) # json parameter set in directive scope
        # create 'file' understandable by Paperclip
        data = StringIO.new(decoded_data)
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end

        # set file properties
        data.content_type = params[:image][:imageContent] # json parameter set in directive scope
        data.original_filename = params[:image][:imagePath] # json parameter set in directive scope

        # update hash, I had to set @up to persist the hash so I can pass it for saving
        # since set_params returns a new hash everytime it is called (and must be used to explicitly list which params are allowed otherwise it throws an exception)
        data # user Icon is the model attribute that i defined as an attachment using paperclip generator
      else
        nil
      end
    end

end
