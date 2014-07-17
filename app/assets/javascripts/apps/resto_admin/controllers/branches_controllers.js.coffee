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
      controller: 'BranchesShowCtrl'
      templateUrl: 'branches/edit.html'
      data:
        ncyBreadcrumbLabel: "Edit Branch Information"
    )

ctrl.controller "BranchesIndexCtrl", ($scope) ->

ctrl.controller "BranchesShowCtrl", ($scope) ->
ctrl.controller "BranchesEditCtrl", ($scope) ->