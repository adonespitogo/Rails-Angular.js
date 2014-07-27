srv = angular.module 'MenuItemServices', ['ngResource']

srv.factory 'MenuItem', ($resource) ->
  $resource('menu_items/:id', {id: '@id'})