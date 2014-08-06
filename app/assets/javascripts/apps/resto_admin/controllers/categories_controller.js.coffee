ctrl = angular.module 'CategoriesControllers', []

ctrl.controller 'NewCategoryCtrl',
  ($scope, $modalInstance, Category) ->

    $scope.category = {}

    $scope.postCategory = ->
      Category.post($scope.category).then (cat) ->
        $scope.categories.push cat
        $scope.notifyUser('success', 'Success', 'Menu Category created successfully.')
        $scope.$close()

