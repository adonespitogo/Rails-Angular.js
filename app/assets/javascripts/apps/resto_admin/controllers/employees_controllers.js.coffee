ctrl = angular.module "EmployeesControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/employees/"

  $stateProvider
    .state('employees',
      url: '/employees'
      controller: 'IndexCtrl'
      templateUrl: tmp_root + 'index.html'
    )

ctrl.controller "IndexCtrl", [
  '$scope',
  ($scope) ->
    
]