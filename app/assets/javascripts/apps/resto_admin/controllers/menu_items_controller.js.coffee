ctrl = angular.module "MenuItemsControllers", ['HelperServices']

ctrl.config ($stateProvider, $urlRouterProvider, templatesProvider) ->

  $stateProvider
    .state('menu_items',
      url: '/menu-items'
      controller: 'MenuItemIndexCtrl'
      templateUrl: templatesProvider.templatePath 'menu_items/index.html'
      data:
        ncyBreadcrumbLabel: "Menu Items"
    )
    .state('menu_items.new',
      url: '/new'
      controller: 'NewMenuItemCtrl'
      templateUrl: templatesProvider.templatePath 'menu_items/new.html'
      data:
        ncyBreadcrumbLabel: "Create"
    )

ctrl.controller "MenuItemIndexCtrl", [
  '$scope', '$modal', 'templates'
  ($scope, $modal, templates) ->

    $scope.quickEdit = ->
      newItemModal = $modal.open(
        templateUrl: templates.templatePath 'menu_items/item_quick_edit.html'
        controller: 'ItemQuickEditCtrl'
      )
]

ctrl.controller "NewMenuItemCtrl", [
  '$scope', 'templates', '$modal'
  ($scope, templates, $modal) ->
    $scope.selectedBanches = []
    $scope.branches = [ {id: 1, name: "Branch 1"}, {id: 2, name: "Branch 2"}, {id: 3, name: "Branch 3"}]
    $scope.branchesSelectSettings =
      displayProp: 'name'
    $scope.categories = [
      {id: 1, label: "Category 1"}
      {id: 2, label: "Category 2"}
    ]
    $scope.selectedCategories = []

    $scope.selectItemOptions = ->
      modal = $modal.open(
        templateUrl: templates.templatePath 'menu_items/select_item_options.html'
        controller: 'SelectItemOptionsCtrl'
      )

    $scope.newItemOption = ->
      modal = $modal.open(
        templateUrl: templates.templatePath 'menu_items/new_item_option.html'
        controller: 'NewItemOptionCtrl'
      )
]

ctrl.controller 'ItemQuickEditCtrl', [
  '$scope', '$modalInstance',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
]

ctrl.controller 'SelectItemOptionsCtrl', [
  '$scope', '$modalInstance',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
]

ctrl.controller 'NewItemOptionCtrl', [
  '$scope', '$modalInstance',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()
]
