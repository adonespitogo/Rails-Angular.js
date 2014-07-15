ctrl = angular.module "BranchesControllers", []

ctrl.config ($stateProvider, $urlRouterProvider) ->

  #template root path
  tmp_root = "apps/resto_admin/views/branches/"

  $stateProvider
    .state('branches',
      url: '/branches'
      controller: 'IndexCtrl'
      templateUrl: tmp_root + 'index.html'
      data:
        ncyBreadcrumbLabel: "Branches"
    )

ctrl.controller "IndexCtrl", [
  '$scope',
  ($scope) ->
    
]