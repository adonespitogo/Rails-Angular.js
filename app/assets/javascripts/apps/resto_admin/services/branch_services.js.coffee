s = angular.module 'BranchServices', ['restangular']

s.factory 'Branch', (Restangular) ->
  Restangular.all('branches')