ctrl = angular.module "DashboardController", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('dashboard',
      url: '/dashboard'
      controller: 'DashboardCtrl'
      templateUrl: 'dashboard.html'
      data:
        ncyBreadcrumbLabel: 'Dashboard'
    )

ctrl.controller "DashboardCtrl",
  ($scope) ->


