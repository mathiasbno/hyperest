angular.module("hyperest")
  .controller "ApplicationCtrl", ($state, $rootScope, $scope, authFactory) ->

    authFactory.auth()

    $scope.logout = ->
      authFactory.logOut()
