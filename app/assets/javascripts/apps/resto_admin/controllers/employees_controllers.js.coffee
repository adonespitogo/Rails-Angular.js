ctrl = angular.module "EmployeesControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('employees',
      url: '/employees'
      controller: 'EmployeesIndexCtrl'
      templateUrl: 'employees/index.html'
      data:
        ncyBreadcrumbLabel: "Employees"
    )
    .state('employees.new',
      url: '/new'
      controller: 'EmployeesNewCtrl'
      templateUrl: 'employees/new.html'
      data:
        ncyBreadcrumbLabel: "New"
    )
    .state('employees.edit',
      url: '/edit/:id'
      controller: 'EmployeesEditCtrl'
      templateUrl: 'employees/edit.html'
      data:
        ncyBreadcrumbLabel: "Edit"
    )

ctrl.controller "EmployeesIndexCtrl", ($scope, Branch, Restangular) ->

  $scope.employees_url = 'resto_admin/employees'

  Branch.getList().then (branches) ->
    $scope.branches = branches

  $scope.filterByBranch = (branch) ->
    $scope.employees_url = if branch.id == null then 'resto_admin/employees' else 'resto_admin/employees?branch_id=' + branch.id
    $scope.selectedBranch = branch

  $scope.deleteEmployee = (user, employees, index) ->
    if confirm "Are you sure you want to delete this employee?"
      Restangular.one('employees', user.id).remove().then ->
        $scope.notifyUser 'success', 'Delete', 'Employee has been removed successfully.'
        employees.splice(index, 1)
        $scope.employees = employees

ctrl.controller "EmployeesNewCtrl", ($scope, Branch, Restangular, Employee, $state) ->

  $scope.employee = {branches:[]}

  $scope.branchesSettings = {displayProp:'name'}

  Branch.getList().then (branches) ->
    $scope.branches = branches

  $scope.selectedBranches = new Array()

  $scope.employee.created_at = new Date()

  $scope.clear = ->
    $scope.employee.created_at = null

  $scope.disabled = (date, mode) ->
    ( mode == 'day' && ( date.getDay() == 0 || date.getDay() == 6 ) )

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

  $scope.dateOptions =
    formatYear: 'yy'
    startingDay: 1

  $scope.createEmployee = (employee) ->
    Employee.post(employee).then((employee) ->
      $scope.notifyUser('success', 'Success', 'Employee added successfully.')
      $state.go('employees')

    ,(errors) ->
      for err in errors.data
        $scope.notifyUser('error', '', err)

    )


ctrl.controller "EmployeesEditCtrl", ($scope, Branch, Restangular, Employee, $state, $stateParams) ->
  $scope.employee = {branches:[]}

  Restangular.one('employees', $stateParams.id).get().then (employee) ->
    $scope.employee = employee


  $scope.branchesSettings = {displayProp:'name'}

  Branch.getList().then (branches) ->
    $scope.branches = branches

  $scope.selectedBranches = new Array()

  $scope.clear = ->
    $scope.employee.created_at = null

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

  $scope.dateOptions =
    formatYear: 'yy'
    startingDay: 1

  $scope.initDate = new Date();

  $scope.updateEmployee = (employee) ->
    employee.put().then((employee) ->
      $scope.notifyUser('success', 'Success', 'Employee updated successfully.')
      $state.go('employees')

    ,(errors) ->
      for err in errors.data
        $scope.notifyUser('error', '', err)

    )