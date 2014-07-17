ctrl = angular.module "OrdersControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('orders',
      url: '/orders'
      controller: 'OrdersIndexCtrl'
      templateUrl: 'orders/index.html'
      data:
        ncyBreadcrumbLabel: "Orders"
    )
    .state('orders.show',
      url: '/details'
      controller: 'ShowCtrl'
      templateUrl: 'orders/show.html'
      data:
        ncyBreadcrumbLabel: "Order Details"
    )

ctrl.controller "OrdersIndexCtrl", ($scope, $modal) ->
    $scope.showOrder = ->
      modal = $modal.open(
        templateUrl: "orders/show.html",
        controller: 'ShowCtrl'
      )


ctrl.controller 'ShowCtrl', ($scope, $modalInstance) ->
  $scope.cancel = ->
    $modalInstance.dismiss('cancel')
