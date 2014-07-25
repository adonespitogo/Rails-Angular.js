class RestoAdmin::BranchesController < RestoAdmin::BaseController
  layout false
  def index
    @branches = @branch_group.branches
  end
end