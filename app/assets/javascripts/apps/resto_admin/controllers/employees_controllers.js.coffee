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
      url: '/edit'
      controller: 'EmployeesNewCtrl'
      templateUrl: 'employees/edit.html'
      data:
        ncyBreadcrumbLabel: "Edit"
    )

ctrl.controller "EmployeesIndexCtrl",
  ($scope) ->

ctrl.controller "EmployeesNewCtrl",
  ($scope) ->

    $scope.branches = [
      {id: 1, label: 'Branch 1'}
      {id: 2, label: 'Branch 2'}
    ]
    $scope.selectedBranches = new Array()

    $scope.dt = new Date()

    $scope.clear = ->
      $scope.dt = null

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
