class RestoAdmin::EmployeesController < RestoAdmin::BaseApiController

  include CleanPagination

  def index
    if params[:branch_id]
      @employees = @branch_group.employees_by_branch(params[:branch_id])
    else
      @employees = @branch_group.employees.distinct
    end
  end

  def create
    @user = User.new(user_params)
    @user.role = 'employee'
    build_employees
    if @user.save
      @employee = @user
      head status: :created
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @employee = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      update_employees
      head status: 200
    else
      render json: @employee.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    head :status => 200
  end

  private
    def user_params
      params.permit(
        :firstname,
        :lastname,
        :phone_number,
        :email,
        :password,
        :password_confirmation,
        :created_at
      )
    end

    def build_employees
      if params[:branches]
        params[:branches].each do |branch_param|
          @user.employees.build(branch_id: branch_param[:id])
        end
      end
    end

    def update_employees
      @user.employees.delete_all
      build_employees
      @user.save
    end
end