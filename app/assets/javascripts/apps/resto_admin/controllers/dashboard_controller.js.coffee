ctrl = angular.module "DashboardController", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/"

  $stateProvider
    .state('dashboard',
      url: '/dashboard'
      controller: 'DashboardCtrl'
      templateUrl: tmp_root + 'dashboard.html'
      data:
        ncyBreadcrumbLabel: 'Dashboard'
    )

ctrl.controller "DashboardCtrl", [
  '$scope',
  ($scope) ->

]

