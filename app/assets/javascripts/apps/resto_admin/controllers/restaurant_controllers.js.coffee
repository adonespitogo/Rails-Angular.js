ctrl = angular.module "RestaurantControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('restaurant', {
      url: '/restaurant'
      controller: 'EditCtrl'
      templateUrl: 'restaurant/edit.html'
      data:
        ncyBreadcrumbLabel: "My Restaurant Details"
    })

ctrl.controller "EditCtrl",
  ($scope) ->

