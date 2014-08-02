app = angular.module('RestoAdminApp', [
  # libs
  'ui.router'
  'ui.bootstrap'
  'ncy-angular-breadcrumb'
  'templates'
  'angularjs-dropdown-multiselect'
  'begriffs.paginate-anything'
  'angular-loading-bar'
  'uploadFile',
  'ngAutocomplete'
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
])

app.config ($breadcrumbProvider, RestangularProvider) ->
    $breadcrumbProvider.setOptions
      prefixStateName: 'dashboard'

    RestangularProvider.setBaseUrl '/resto_admin'