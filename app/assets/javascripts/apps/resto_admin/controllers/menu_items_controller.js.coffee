ctrl = angular.module "MenuItemsControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/menu_items/"

  $stateProvider
    .state('menu_items',
      url: '/menu-items'
      controller: 'IndexCtrl'
      templateUrl: tmp_root + 'index.html'
    )

ctrl.controller "IndexCtrl", [
  '$scope',
  ($scope) ->
    
]