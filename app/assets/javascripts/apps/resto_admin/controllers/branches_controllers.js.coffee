ctrl = angular.module "BranchesControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state('branches',
      url: '/branches'
      controller: 'BranchesIndexCtrl'
      templateUrl: 'branches/index.html'
      data:
        ncyBreadcrumbLabel: "Branches"
    )
    .state('branches.show',
      url: '/details'
      controller: 'BranchesShowCtrl'
      templateUrl: 'branches/show.html'
      data:
        ncyBreadcrumbLabel: "Branch Information"
    )
    .state('branches.edit',
      url: '/edit'
      controller: 'BranchesEditCtrl'
      templateUrl: 'branches/edit.html'
      data:
        ncyBreadcrumbLabel: "Edit Branch"
    )

ctrl.controller "BranchesIndexCtrl", ($scope) ->

ctrl.controller "BranchesShowCtrl", ($scope) ->

ctrl.controller "BranchesEditCtrl", ($scope, $modal) ->
  console.log $modal
  $scope.addDeliveryZone = ->
    modal = $modal.open
              templateUrl: 'branches/add_delivery_zone.html'
              controller: 'BranchesAddDeliveryZoneCtrl'

ctrl.controller "BranchesAddDeliveryZoneCtrl", ($scope, $modalInstance) ->


