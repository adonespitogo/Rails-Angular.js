class RestoAdmin::EmployeesController < RestoAdmin::BaseApiController
  def create
    @employee = User.new(employee_params)
    if @employee.save
      @employee.branches = find_assigned_branches
      head status: :created
    else
      render json: @employee.errors.full_messages, status: 422
    end
  end

  def show
    @employee = User.find(params[:id])
  end

  private
    def employee_params
      params.permit(
        :firstname,
        :lastname,
        :phone_number,
        :email,
        :password,
        :password_confirmation
      )
    end

    def find_assigned_branches
      branches = []
      if params[:branches]
        params[:branches].each do |branch_param|
          branches << Branch.find(branch_param[:id])
        end
      end
      branches
    end
end