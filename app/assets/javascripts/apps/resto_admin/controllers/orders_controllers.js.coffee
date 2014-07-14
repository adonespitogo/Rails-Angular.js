ctrl = angular.module "OrdersControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/orders/"

  $stateProvider
    .state('orders',
      url: '/orders'
      controller: 'IndexCtrl'
      templateUrl: tmp_root + 'index.html'
    )

ctrl.controller "IndexCtrl", [
  '$scope',
  ($scope) ->
    
]