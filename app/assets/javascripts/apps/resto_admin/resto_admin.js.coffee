app = angular.module('RestoAdminApp', [
  # libs
  'ui.router'
  'ui.bootstrap'
  'ncy-angular-breadcrumb'
  'templates'
  'angularjs-dropdown-multiselect'
  'begriffs.paginate-anything'
  'angular-loading-bar'
  'uploadFile'
  'ngAutocomplete'
  'ngMap',
  'toaster'
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
  'BranchServices'
  'ItemOptionsServices'
  'EmployeesServices'
])

app.config ($breadcrumbProvider, RestangularProvider) ->
    $breadcrumbProvider.setOptions
      prefixStateName: 'dashboard'

    RestangularProvider.setBaseUrl '/resto_admin'