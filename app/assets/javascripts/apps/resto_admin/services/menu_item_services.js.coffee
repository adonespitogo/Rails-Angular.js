srv = angular.module 'MenuItemServices', ['restangular']

srv.factory 'MenuItem', (Restangular) ->
  Restangular.all('menu_items')