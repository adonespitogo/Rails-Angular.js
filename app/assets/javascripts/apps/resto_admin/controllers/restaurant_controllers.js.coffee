ctrl = angular.module "RestaurantControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/restaurant/"

  $stateProvider
    .state('restaurant', {
      url: '/restaurant'
      controller: 'EditCtrl'
      templateUrl: tmp_root + 'edit.html'
      data:
        ncyBreadcrumbLabel: "My Restaurant Details"
    })

ctrl.controller "EditCtrl",
  ($scope) ->

