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
  ($scope, $modal, Category) ->

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

    $scope.allMenuItems = ->
      $scope.categoryId = null
      $scope.menu_items_url = "/resto_admin/menu_items"

ctrl.controller "NewMenuItemCtrl",
  ($scope, $modal, Branch, Category, MenuItem) ->

    $scope.branchesSelectSettings = $scope.categoriesSelectSettings = {displayProp: 'name'}

    Branch.getList().then (branches) ->
      $scope.branches = branches

    Category.getList().then (cats) ->
      $scope.categories = cats

    $scope.addMoreOptions = ->
      modal = $modal.open(
        templateUrl: 'menu_items/add_more_options.html'
        controller: 'AddMoreItemOptionsCtrl'
      )

    $scope.item = {branches: [], categories: []}

    $scope.save = (active) ->
      $scope.item.deleted_at = if active then null else new Date()
      menu_item = new MenuItem(menu_item: $scope.item)
      menu_item.$save (item) ->
        $scope.alerts = [{type: 'success', msg: 'Menu item saved.'}]


ctrl.controller 'ItemQuickEditCtrl',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()

ctrl.controller 'AddMoreItemOptionsCtrl',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
