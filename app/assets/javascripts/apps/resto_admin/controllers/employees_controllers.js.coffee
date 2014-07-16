ctrl = angular.module "EmployeesControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('employees',
      url: '/employees'
      controller: 'IndexCtrl'
      templateUrl: 'employees/index.html'
      data:
        ncyBreadcrumbLabel: "Employees"
    )

ctrl.controller "IndexCtrl",
  ($scope) ->
