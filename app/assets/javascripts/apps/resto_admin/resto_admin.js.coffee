app = angular.module('RestoAdminApp', [
  # libs
  'ui.router'
  'ui.bootstrap'
  'ncy-angular-breadcrumb'
  'templates'
  'angularjs-dropdown-multiselect'
  # controllers
  'MainController'
  'DashboardController'
  'RestaurantControllers'
  'MenuItemsControllers'
  'OrdersControllers'
  'BranchesControllers'
  'EmployeesControllers'
  'CategoriesControllers'
  # services
  'MenuItemServices'
  'CategoryServices'
])

app.config ($breadcrumbProvider, RestangularProvider) ->
    $breadcrumbProvider.setOptions
      prefixStateName: 'dashboard'

    RestangularProvider.setBaseUrl '/resto_admin'