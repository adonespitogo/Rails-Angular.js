ctrl = angular.module "OrdersControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/orders/"

  $stateProvider
    .state('dashboard.orders',
      url: '/orders'
      controller: 'IndexCtrl'
      templateUrl: tmp_root + 'index.html'
      data:
        ncyBreadcrumbLabel: "Orders"
    )

ctrl.controller "IndexCtrl", [
  '$scope',
  ($scope) ->
    
]