ctrl = angular.module "OrdersControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('orders',
      url: '/orders'
      controller: 'IndexCtrl'
      templateUrl: 'orders/index.html'
      data:
        ncyBreadcrumbLabel: "Orders"
    )

ctrl.controller "IndexCtrl",
  ($scope) ->
