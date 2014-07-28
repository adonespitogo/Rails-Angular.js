s = angular.module "ItemOptionsServices", ['restangular']

s.factory "ItemOption", (Restangular) ->
  Restangular.all('item_options')