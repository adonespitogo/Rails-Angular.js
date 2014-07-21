ctrl = angular.module "MenuItemsControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('menu_items',
      abstract: true
      url: '/menu-items'
      template: '<div ui-view></div>'
      data:
        ncyBreadcrumbLabel: "Menu Items"
    )
    .state('menu_items.list',
      url: '/list'
      controller: 'MenuItemIndexCtrl'
      templateUrl: 'menu_items/index.html'
      data:
        ncyBreadcrumbLabel: "Menu Items"
        ncyBreadcrumbParent: "menu_items"
    )
    .state('menu_items.new',
      url: '/new'
      controller: 'NewMenuItemCtrl'
      templateUrl: 'menu_items/new.html'
      data:
        ncyBreadcrumbLabel: "Create"
        ncyBreadcrumbParent: "menu_items.list"
    )

ctrl.controller "MenuItemIndexCtrl",
  ($scope, $modal, MenuItem, Category) ->

    $scope.menu_items_url = "/resto_admin/menu_items"

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

    $scope.filterByCategory = (cat_id) ->
      $scope.categoryId = cat_id
      $scope.menu_items_url = "/resto_admin/menu_items?category_id=" + cat_id
      console.log $scope.menu_items_url

    $scope.allMenuItems = ->
      $scope.categoryId = null
      $scope.menu_items_url = "/resto_admin/menu_items"

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
