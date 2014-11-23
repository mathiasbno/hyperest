angular.module("hyperest")
  .config ($locationProvider, $stateProvider, $urlRouterProvider) ->
    $locationProvider.html5Mode true

    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: '/templates/home/index.html'
        controller: 'FrontPageCtrl'
