s = angular.module 'EmployeesServices', ['restangular']

s.factory 'Employee', (Restangular) ->
  Restangular.all('employees')