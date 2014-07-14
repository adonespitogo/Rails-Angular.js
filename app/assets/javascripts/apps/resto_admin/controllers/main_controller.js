var main_ctrl;

main_ctrl = angular.module("MainController", []);

main_ctrl.controller("MainCtrl", [
  '$scope', function($scope) {
    return $scope.left_nav = [
      {
        ref: "dashboard",
        text: "Dashboard",
        icon: "fa fa-dashboard"
      }, {
        ref: "customers",
        text: "Customers",
        icon: "fa fa-users"
      }, {
        ref: "bills",
        text: "Bills",
        icon: "fa fa-file-text"
      }
    ];
  }
]);

main_ctrl.config(function($stateProvider, $urlRouterProvider) {
  var templates_path;
  $urlRouterProvider.otherwise('/dashboard');
  templates_path = "apps/resto_admin/views/";
  return $stateProvider.state('dashboard', {
    url: '/dashboard',
    controller: 'DashboardCtrl',
    template: JST[templates_path + "dashboard"]
  });
});

main_ctrl.controller('DashboardCtrl', ['$scope', function($scope) {}]);
