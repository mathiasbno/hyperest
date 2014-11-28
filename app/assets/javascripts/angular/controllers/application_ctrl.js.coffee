angular.module("hyperest")
  .controller "ApplicationCtrl", ($state, $rootScope, $scope, authFactory) ->

    authFactory.auth()

    this.logout = ->
      authFactory.logOut()

    return this
