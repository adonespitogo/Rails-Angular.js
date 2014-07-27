ctrl = angular.module 'CategoriesControllers', []

ctrl.controller 'NewCategoryCtrl',
  ($scope, $modalInstance, Category) ->

    $scope.category = {}

    $scope.postCategory = ->
      Category.post($scope.category).then (cat) ->
        $scope.categories.push cat
        $scope.alerts.push type: 'success', msg: 'Menu Category created successfully.'
        $scope.$close()

    # $scope.cancel =  ->
    #   $modalInstance.dismiss()

    # $scope.categoryForOpts = [{id: 1, label: 'This branch only'}, {'id':2, label: 'Branch Group'}]
    # $scope.categoryFor = []
    # $scope.categoryForExtraSettings = {
    #   selectionLimit: 1
    #   showCheckAll: false
    #   showUncheckAll: false
    # }

