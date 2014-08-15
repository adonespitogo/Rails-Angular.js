class RestoAdmin::RestaurantController < RestoAdmin::BaseApiController

  def show
    @restaurant = @branch_group.restaurant
  end
  def update
    @restaurant = @branch_group.restaurant
    @restaurant.assign_attributes(restaurant_params)
    @restaurant.logo = decode_image if params[:img]
    if @restaurant.save
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

    def decode_image
      # decode base64 string
      if params[:img]
        Rails.logger.info 'decoding now'
        decoded_data = Base64.decode64(params[:img][:imageData]) # json parameter set in directive scope
        # create 'file' understandable by Paperclip
        data = StringIO.new(decoded_data)
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end

        # set file properties
        data.content_type = params[:img][:imageContent] # json parameter set in directive scope
        data.original_filename = params[:img][:imagePath] # json parameter set in directive scope

        # update hash, I had to set @up to persist the hash so I can pass it for saving
        # since set_params returns a new hash everytime it is called (and must be used to explicitly list which params are allowed otherwise it throws an exception)
        data # user Icon is the model attribute that i defined as an attachment using paperclip generator
      else
        nil
      end
    end
end