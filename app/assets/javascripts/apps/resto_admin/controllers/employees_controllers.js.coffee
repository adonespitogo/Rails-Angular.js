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
    $scope.employees_url = 'resto_admin/employees?branch_id=' + branch.id
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

  $scope.employee.employment_date = new Date()

  $scope.clear = ->
    $scope.employee.employment_date = null

  $scope.disabled = (date, mode) ->
    ( mode == 'day' && ( date.getDay() == 0 || date.getDay() == 6 ) )

  $scope.toggleMin = ->
    $scope.minDate = if $scope.minDate then null else new Date()

  $scope.toggleMin()

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

  $scope.dateOptions =
    formatYear: 'yy'
    startingDay: 1

  $scope.initDate = new Date('2016-15-20');
  $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
  $scope.format = $scope.formats[0];

  $scope.createEmployee = (employee) ->
    Employee.post(employee).then((employee) ->
      $scope.notifyUser('success', 'Success', 'Employee added successfully.')
      $state.go('employees')

    ,(errors) ->
      for err in errors.data
        $scope.notifyUser('error', '', err)

    )


ctrl.controller "EmployeesEditCtrl", ($scope, Branch, Restangular, Employee, $state, $stateParams) ->

  Restangular.one('employees', $stateParams.id).get().then (employee) ->
    $scope.employee = employee

  $scope.employee = {branches:[]}

  $scope.branchesSettings = {displayProp:'name'}

  Branch.getList().then (branches) ->
    $scope.branches = branches

  $scope.selectedBranches = new Array()

  $scope.employee.employment_date = new Date()

  $scope.clear = ->
    $scope.employee.employment_date = null

  $scope.disabled = (date, mode) ->
    ( mode == 'day' && ( date.getDay() == 0 || date.getDay() == 6 ) )

  $scope.toggleMin = ->
    $scope.minDate = if $scope.minDate then null else new Date()

  $scope.toggleMin()

  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true

  $scope.dateOptions =
    formatYear: 'yy'
    startingDay: 1

  $scope.initDate = new Date('2016-15-20');
  $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
  $scope.format = $scope.formats[0];

  $scope.updateEmployee = (employee) ->
    employee.put().then((employee) ->
      $scope.notifyUser('success', 'Success', 'Employee updated successfully.')
      $state.go('employees')

    ,(errors) ->
      for err in errors.data
        $scope.notifyUser('error', '', err)

    )