angular.module("hyperest")
  .controller "LoginCtrl", ($scope, $rootScope, authFactory) ->

    $scope.login = (provider) ->
      authFactory.login(provider).then (user) ->
        authFactory.createCurrentUser(user)
