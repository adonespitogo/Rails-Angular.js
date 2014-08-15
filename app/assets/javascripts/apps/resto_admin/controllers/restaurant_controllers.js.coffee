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

ctrl.controller "EditCtrl", ($scope, $http) ->
  $http.get('resto_admin/restaurant')
  .success (restaurant, status) ->
    $scope.restaurant = restaurant

  $scope.updateRestaurant = (restaurant) ->
    $http.put('resto_admin/restaurant', restaurant)
    .success (restaurant) ->
      $scope.notifyUser('success', 'Success', 'Restaurant information has been updated successfully.')
    .error (error) ->
      for err in errors.data
        $scope.notifyUser('error', '', err)
