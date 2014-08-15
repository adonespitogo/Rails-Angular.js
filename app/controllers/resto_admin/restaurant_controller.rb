class RestoAdmin::RestaurantController < RestoAdmin::BaseApiController

  def show
    @restaurant = @branch_group.restaurant
  end
  def update
    @restaurant = @branch_group.restaurant
    if @restaurant.update(restaurant_params)
      render :show
    else
      render json: @restaurant.errors.full_messages, status: 422
    end
  end

  private
    def restaurant_params
      params.permit(
        :name, :slug, :description, :meta_keywords, :meta_description,
        :fb_link, :twitter_link, :gplus_link, :instagram_link, :foursquare_link
      )
    end
end