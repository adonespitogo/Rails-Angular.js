srv = angular.module 'MenuItemServices', ['ngResource']

srv.factory 'MenuItem', ($resource) ->
  $resource('resto_admin/menu_items/:id', {id: '@id'})