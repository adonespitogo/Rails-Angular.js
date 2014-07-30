class RestoAdmin::BranchesController < RestoAdmin::BaseController
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  layout false
  def index
    @branches = @branch_group.branches
  end

  def create
    @branch = Branch.new(branch_params)
    @branch.branch_group_id = @branch_group.id
    @branch.save
    render :show
  end

  def show
    @branch = Branch.find(params[:id])
  end

  private
    def branch_params
      params.require(:branch).permit(:name, :slug, :address, :phone_number, :working_hour_start,
        :working_hour_end, :lat, :lng, :minimum_order_amount, :delivery_hour_start, :delivery_hour_end,
        :meta_keywords, :meta_description
      )
    end
end