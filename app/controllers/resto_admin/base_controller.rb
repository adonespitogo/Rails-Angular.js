class RestoAdmin::BaseController < ApplicationController

  before_action :authenticate_user!, :validate_resto_admin
  before_action :load_branch_group

  layout "resto_admin"

  private
    def validate_resto_admin
      if user_signed_in? && !current_user.is_resto_admin?
        if request.xhr?
          render status :forbidden
        else
          flash[:alert] = "You must be a restaurant admin to access the requested page."
          redirect_to root_path
        end
      end
    end

    def load_branch_group
      @branch_group = current_user.branch_groups.first
    end
end