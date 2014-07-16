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
    .state('menu_items.new',
      url: '/new'
      controller: 'NewMenuItemCtrl'
      templateUrl: tmp_root + 'new.html'
      data:
        ncyBreadcrumbLabel: "Create"
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

ctrl.controller "NewMenuItemCtrl", [
  '$scope',
  ($scope) ->
    $scope.selectedBanches = []
    $scope.branches = [ {id: 1, name: "Branch 1"}, {id: 2, name: "Branch 2"}, {id: 3, name: "Branch 3"}]
    $scope.branchesSelectSettings =
      displayProp: 'name'
    $scope.categories = [
      {id: 1, label: "Category 1"}
      {id: 2, label: "Category 2"}
    ]
    $scope.selectedCategories = []
]

ctrl.controller 'ItemQuickEditCtrl', [
  '$scope', '$modalInstance',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
]