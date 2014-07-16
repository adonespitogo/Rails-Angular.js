app = angular.module('RestoAdminApp', [
  # libs
  'ui.router'
  'ui.bootstrap'
  'ncy-angular-breadcrumb'
  'templates'
  'angularjs-dropdown-multiselect'
  # app modules
  'MainController'
  'DashboardController'
  'RestaurantControllers'
  'MenuItemsControllers'
  'OrdersControllers'
  'BranchesControllers'
  'EmployeesControllers'
])

app.config ($breadcrumbProvider) ->
    $breadcrumbProvider.setOptions
      prefixStateName: 'dashboard'