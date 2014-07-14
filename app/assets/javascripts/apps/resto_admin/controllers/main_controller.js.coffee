main_ctrl = angular.module "MainController", []


main_ctrl.config ($stateProvider, $urlRouterProvider) ->

  #default state of application
  $urlRouterProvider.otherwise('/dashboard')

main_ctrl.controller "MainCtrl", [
  '$scope',
  ($scope) ->
    $scope.navigation = [
      {ref: 'dashboard', text: 'Dashboard'}
      {ref: 'menu_items', text: 'Menu Items'}
      {ref: 'orders', text: 'Orders'}
      {ref: 'branches', text: 'Branches'}
      {ref: 'employees', text: 'Employees'}
    ]
]
