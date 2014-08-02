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
  Branch.getList().then (branches) ->
    $scope.branches = branches

ctrl.controller "BranchesShowCtrl", ($scope, $stateParams, Restangular) ->
  Restangular.one('branches', $stateParams.id).get().then (b) ->
    $scope.branch = b

ctrl.controller "BranchesEditCtrl", ($scope, Restangular, $stateParams) ->

  Restangular.one('branches', $stateParams.id).get().then (b) ->
    $scope.branch = b

  $scope.addDeliveryZone = ->
    # delivery_zone = 

  $scope.saveBranch = (branch) ->
    $scope.branch.put().then (branch) ->
      $scope.alerts.push {type: 'success', msg: 'Branch added successfully.'}


ctrl.controller "BranchesNewCtrl", ($scope, $modal, Branch) ->
  $scope.addDeliveryZone = ->
    modal = $modal.open
              templateUrl: 'branches/add_delivery_zone.html'
              controller: 'BranchesAddDeliveryZoneCtrl'

  $scope.saveBranch = (branch) ->
    Branch.post({branch: branch}).then (branch) ->
      $scope.alerts.push {type: 'success', msg: 'Branch added successfully.'}


