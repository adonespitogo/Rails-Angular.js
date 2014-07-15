main_ctrl = angular.module "MainController", []


main_ctrl.config ($stateProvider, $urlRouterProvider) ->

  #default state of application
  $urlRouterProvider.otherwise('/dashboard')

main_ctrl.controller "MainCtrl", [
  '$scope',
  ($scope) ->

    $scope.navigation = [
      {ref: 'dashboard', text: 'Dashboard'}
      {ref: 'dashboard.menu_items', text: 'Menu Items'}
      {ref: 'dashboard.orders', text: 'Orders'}
      {ref: 'dashboard.branches', text: 'Branches'}
      {ref: 'dashboard.employees', text: 'Employees'}
    ]

    $scope.alerts = []

    $scope.addAlert = ->
      $scope.alerts.push({msg: 'Another alert!'});

    $scope.closeAlert = (index) ->
      $scope.alerts.splice(index, 1)
]
