app = angular.module('RestoAdminApp', [
  # libs
  'ui.router'
  'ui.bootstrap'
  'ncy-angular-breadcrumb'
  'templates'
  'angularjs-dropdown-multiselect'
  'begriffs.paginate-anything'
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
])

app.config ($breadcrumbProvider, RestangularProvider) ->
    $breadcrumbProvider.setOptions
      prefixStateName: 'dashboard'

    RestangularProvider.setBaseUrl '/resto_admin'