main_ctrl = angular.module "MainController", []


main_ctrl.config ($stateProvider, $urlRouterProvider) ->

  #default state of application
  $urlRouterProvider.otherwise('/dashboard')

main_ctrl.controller "MainCtrl",
  ($scope) ->

    $scope.navigation = [
      {ref: 'dashboard', text: 'Dashboard'}
      {ref: 'menu_items.list', text: 'Menu Items'}
      {ref: 'orders', text: 'Orders'}
      {ref: 'branches', text: 'Branches'}
      {ref: 'employees', text: 'Employees'}
    ]

    $scope.alerts = []

    $scope.addAlert = ->
      $scope.alerts.push({msg: 'Another alert!'});

    $scope.closeAlert = (index) ->
      $scope.alerts.splice(index, 1)
