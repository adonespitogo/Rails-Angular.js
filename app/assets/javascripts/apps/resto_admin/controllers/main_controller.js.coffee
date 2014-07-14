main_ctrl = angular.module "MainController", []


main_ctrl.config ($stateProvider, $urlRouterProvider) ->

  #default state of application
  $urlRouterProvider.otherwise('/dashboard')

  console.log $urlRouterProvider

  #template root path
  tmp_root = "apps/company_admin/views/"

  $stateProvider
    .state('dashboard',
      url: '/dashboard'
      controller: 'DashboardCtrl'
      template: 'sadfasdf'
    )

main_ctrl.controller "MainCtrl", [
  '$scope',
  ($scope) ->
]

main_ctrl.controller "DashboardCtrl", [
  '$scope',
  ($scope) ->
    console.log "DashboardCtrl"
]
