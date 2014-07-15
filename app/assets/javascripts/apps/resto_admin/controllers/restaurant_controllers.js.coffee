ctrl = angular.module "RestaurantControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/restaurant/"

  $stateProvider
    .state('dashboard.restaurant', {
      url: '/restaurant'
      controller: 'ShowCtrl'
      templateUrl: tmp_root + 'index.html'
      data:
        ncyBreadcrumbLabel: "My Restaurant"
    })
    .state('dashboard.restaurant.edit', {
      url: '/edit'
      controller: 'EditCtrl'
      templateUrl: tmp_root + 'edit.html'
      data:
        ncyBreadcrumbLabel: "Edit"
    })

ctrl.controller "ShowCtrl", [
  '$scope',
  ($scope) ->

]

ctrl.controller "EditCtrl", [
  '$scope',
  ($scope) ->

]