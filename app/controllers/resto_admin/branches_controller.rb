class RestoAdmin::BranchesController < RestoAdmin::BaseApiController

  include CleanPagination

  before_action :find_branch

  def index
    @branches = @branch_group.branches
  end

  def create
    @branch = Branch.new(branch_params)
    build_branch_delivery_zones
    @branch.branch_group_id = @branch_group.id
    if @branch.save
      render :show
    else
      render :json => @branch.errors.full_messages, status: 422
    end
  end

  def update
    if @branch.update_attributes(branch_params)
      @branch.delivery_zones.clear
      build_branch_delivery_zones
      @branch.save
      render :show
    else
      render :json => @branch.errors.full_messages, status: 422
    end
  end

  def show
    @branch = Branch.find(params[:id])
  end

  private
    def find_branch
      @branch = Branch.find(params[:id]) if params[:id]
    end
    def branch_params
      params.permit(:name, :slug, :address, :phone_number, :working_hour_start,
        :working_hour_end, :lat, :lng, :minimum_order_amount, :delivery_hour_start, :delivery_hour_end,
        :meta_keywords, :meta_description
      )
    end

    def build_branch_delivery_zones
      (params[:branch_delivery_zones] || []).each do |zone|
        @branch.delivery_zones.build(zone.permit(:branch_id, :delivery_charge, :delivery_charge_type, :radius, :lat, :lng, :address))
      end
    end
end