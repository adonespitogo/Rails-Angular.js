ctrl = angular.module "RestaurantControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/restaurant/"

  $stateProvider
    .state('restaurant',
      url: '/restaurant'
      controller: 'ShowCtrl'
      templateUrl: tmp_root + 'show.html'
    )

ctrl.controller "ShowCtrl", [
  '$scope',
  ($scope) ->

]