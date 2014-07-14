main_ctrl = angular.module "MainController", []


main_ctrl.config ($stateProvider, $urlRouterProvider) ->

  #default state of application
  $urlRouterProvider.otherwise('/dashboard')

main_ctrl.controller "MainCtrl", [
  '$scope',
  ($scope) ->
]
