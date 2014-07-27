s = angular.module "CategoryServices", ['restangular']

s.factory "Category", (Restangular) ->
  Restangular.all('menu_categories')