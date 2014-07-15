ctrl = angular.module "MenuItemsControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/menu_items/"

  $stateProvider
    .state('menu_items',
      url: '/menu-items'
      controller: 'MenuItemIndexCtrl'
      templateUrl: tmp_root + 'index.html'
      data:
        ncyBreadcrumbLabel: "Menu Items"
    )

ctrl.controller "MenuItemIndexCtrl", [
  '$scope', '$modal'
  ($scope, $modal) ->
    #template root path
    tmp_root = "apps/resto_admin/views/menu_items/"

    $scope.quickEdit = ->
      newItemModal = $modal.open(
        templateUrl: tmp_root + 'item_quick_edit.html'
        controller: 'ItemQuickEditCtrl'
      )
]

ctrl.controller 'ItemQuickEditCtrl', [
  '$scope', '$modalInstance',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
]