ctrl = angular.module 'CategoriesControllers', []

ctrl.controller 'NewCategoryCtrl',
  ($scope, $modalInstance) ->

    $scope.cancel =  ->
      $modalInstance.dismiss()

    $scope.categoryForOpts = [{id: 1, label: 'This branch only'}, {'id':2, label: 'Branch Group'}]
    $scope.categoryFor = []
    $scope.categoryForExtraSettings = {
      selectionLimit: 1
      showCheckAll: false
      showUncheckAll: false
    }

