class RestoAdmin::ItemOptionsController < RestoAdmin::BaseController
  layout false
  def index
    @item_options = ItemOption.includes(:options).all
  end
end
