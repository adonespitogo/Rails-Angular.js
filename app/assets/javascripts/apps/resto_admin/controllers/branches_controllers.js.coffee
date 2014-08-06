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

ctrl.controller "BranchesIndexCtrl", ($scope, Restangular, toaster) ->
  $scope.branches_url = '/resto_admin/branches'
  $scope.deleteBranch = (branches, branch, index)->
    if confirm "Are you sure you want to delete this branch?"
      Restangular.one('branches', branch.id).remove().then ->
        branches.splice(index, 1)
        $scope.branches = branches
        $scope.notifyUser('success', 'Success', 'Branch deleted successfully.')

ctrl.controller "BranchesShowCtrl", ($scope, $stateParams, Restangular, $state) ->

  $scope.deleteBranch = (branch)->
    if confirm "Are you sure you want to delete this branch?"
      Restangular.one('branches', branch.id).remove().then ->
      $scope.notifyUser('success', 'Success', 'Branch deleted successfully.')
      $state.go('branches')

  $scope.center = null

  $scope.$on 'mapInitialized', (event, map) ->
    $scope.$watch 'center', ->
      map.setCenter($scope.center) if $scope.center != null
      loc = new google.maps.LatLng($scope.center.lat, $scope.center.lng);
      $scope.dynMarkers[0].setPosition(loc);
      $scope.dynMarkers[0].setMap(map);

  $scope.dynMarkers = [(new google.maps.Marker({
            title: "Marker"
          }))]

  Restangular.one('branches', $stateParams.id).get().then (b) ->
    $scope.branch = b
    $scope.center = {lat:b.lat, lng: b.lng}

ctrl.controller "BranchesEditCtrl", ($scope, Restangular, $stateParams) ->

  $scope.branch = {data: {}}

  Restangular.one('branches', $stateParams.id).get().then (b) ->
    $scope.branch = b
    $scope.branch.data = ''

  $scope.addDeliveryZone = ->

    zone = {
      address: $scope.address,
      delivery_charge: $scope.delivery_charge,
      delivery_charge_type: $scope.delivery_charge_type,
      radius: $scope.radius,
      lng: $scope.data.geometry.location.k,
      lat: $scope.data.geometry.location.B
    }

    $scope.branch.branch_delivery_zones.push zone

  $scope.saveBranch = (branch) ->
    $scope.branch.lat = $scope.branch.data.geometry.location.k if $scope.branch.data.geometry
    $scope.branch.lng = $scope.branch.data.geometry.location.B if $scope.branch.data.geometry
    delete $scope.branch.data
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
      lng: $scope.data.geometry.location.k,
      lat: $scope.data.geometry.location.B
    }

    $scope.branch.branch_delivery_zones.push zone

  $scope.saveBranch = (branch) ->
    $scope.branch.lat = $scope.branch.data.geometry.location.k if $scope.branch.data.geometry
    $scope.branch.lng = $scope.branch.data.geometry.location.B if $scope.branch.data.geometry
    delete $scope.branch.data
    Branch.post(branch).then (branch) ->
      $scope.notifyUser('success', 'Success', 'Branch added successfully.')
      $state.go('branches')

