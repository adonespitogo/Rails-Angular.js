class RestoAdmin::EmployeesController < RestoAdmin::BaseApiController
  def create
    respond_to json: params
  end
end