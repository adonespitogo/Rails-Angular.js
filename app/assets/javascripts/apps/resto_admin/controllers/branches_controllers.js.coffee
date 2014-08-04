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
      url: '/details/:id'
      controller: 'BranchesShowCtrl'
      templateUrl: 'branches/show.html'
      data:
        ncyBreadcrumbLabel: "Branch Information"
    )
    .state('branches.edit',
      url: '/edit/:id'
      controller: 'BranchesEditCtrl'
      templateUrl: 'branches/edit.html'
      data:
        ncyBreadcrumbLabel: "Edit Branch"
    )
    .state('branches.new',
      url: '/new'
      controller: 'BranchesNewCtrl'
      templateUrl: 'branches/new.html'
      data:
        ncyBreadcrumbLabel: "Create New"
    )

ctrl.controller "BranchesIndexCtrl", ($scope, Branch) ->

  $scope.branches_url = '/resto_admin/branches'

ctrl.controller "BranchesShowCtrl", ($scope, $stateParams, Restangular) ->
  Restangular.one('branches', $stateParams.id).get().then (b) ->
    $scope.branch = b

ctrl.controller "BranchesEditCtrl", ($scope, Restangular, $stateParams) ->


  Restangular.one('branches', $stateParams.id).get().then (b) ->
    $scope.branch = b

  $scope.addDeliveryZone = ->

    zone = {
      address: $scope.address,
      delivery_charge: $scope.delivery_charge,
      delivery_charge_type: $scope.delivery_charge_type,
      radius: $scope.radius,
      lat: $scope.data.geometry.location.k,
      lng: $scope.data.geometry.location.B
    }

    $scope.branch.branch_delivery_zones.push zone

  $scope.saveBranch = (branch) ->
    $scope.branch.put().then (branch) ->
      $scope.branch = branch
      $scope.alerts.push {type: 'success', msg: 'Branch added successfully.'}


ctrl.controller "BranchesNewCtrl", ($scope, Branch, $state) ->

  $scope.branch = {branch_delivery_zones: []}

  $scope.addDeliveryZone = ->

    zone = {
      address: $scope.address,
      delivery_charge: $scope.delivery_charge,
      delivery_charge_type: $scope.delivery_charge_type || 'amount',
      radius: $scope.radius,
      lat: $scope.data.geometry.location.k,
      lng: $scope.data.geometry.location.B
    }

    $scope.branch.branch_delivery_zones.push zone

  $scope.saveBranch = (branch) ->
    Branch.post(branch).then (branch) ->
      $scope.alerts.push {type: 'success', msg: 'Branch added successfully.'}
      $state.go('branches')

