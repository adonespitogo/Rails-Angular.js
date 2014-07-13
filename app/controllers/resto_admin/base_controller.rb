class RestoAdmin::BaseController < ApplicationController

  before_action :authenticate_user!, :validate_resto_admin

  layout "resto_admin"

  private
  def validate_resto_admin
    if user_signed_in? && !current_user.is_resto_admin?
      flash[:alert] = "You must be a restaurant employee to access the requested page."
      redirect_to root_path
    end
  end
end