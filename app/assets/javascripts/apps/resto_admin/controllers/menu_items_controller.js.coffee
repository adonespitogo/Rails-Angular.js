ctrl = angular.module "MenuItemsControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('menu_items',
      url: '/menu-items'
      controller: 'MenuItemIndexCtrl'
      templateUrl: 'menu_items/index.html'
      data:
        ncyBreadcrumbLabel: "Menu Items"
    )
    .state('menu_items.new',
      url: '/new'
      controller: 'NewMenuItemCtrl'
      templateUrl: 'menu_items/new.html'
      data:
        ncyBreadcrumbLabel: "Create"
    )

ctrl.controller "MenuItemIndexCtrl",
  ($scope, $modal, MenuItem, Category) ->

    MenuItem.getList().then (menu_items) ->
      $scope.menu_items = menu_items

    Category.getList().then (categories) ->
      $scope.categories = categories


    $scope.quickEdit = ->
      newItemModal = $modal.open(
        templateUrl: 'menu_items/item_quick_edit.html'
        controller: 'ItemQuickEditCtrl'
      )

    $scope.newCategory = ->
      modal = $modal.open(
        templateUrl: 'categories/new.html'
        controller: 'NewCategoryCtrl'
      )

ctrl.controller "NewMenuItemCtrl",
  ($scope, $modal) ->
    $scope.selectedBanches = []
    $scope.branches = [ {id: 1, name: "Branch 1"}, {id: 2, name: "Branch 2"}, {id: 3, name: "Branch 3"}]
    $scope.branchesSelectSettings =
      displayProp: 'name'
    $scope.categories = [
      {id: 1, label: "Category 1"}
      {id: 2, label: "Category 2"}
    ]
    $scope.selectedCategories = []

    $scope.addMoreOptions = ->
      modal = $modal.open(
        templateUrl: 'menu_items/add_more_options.html'
        controller: 'AddMoreItemOptionsCtrl'
      )

ctrl.controller 'ItemQuickEditCtrl',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()

ctrl.controller 'AddMoreItemOptionsCtrl',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
