ctrl = angular.module "MenuItemsControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/menu_items/"

  $stateProvider
    .state('dashboard.menu_items',
      url: '/menu-items'
      controller: 'IndexCtrl'
      templateUrl: tmp_root + 'index.html'
      data:
        ncyBreadcrumbLabel: "Menu Items"
    )

ctrl.controller "IndexCtrl", [
  '$scope',
  ($scope) ->
    
]