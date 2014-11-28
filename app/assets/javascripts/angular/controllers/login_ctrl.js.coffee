angular.module("hyperest")
  .controller "LoginCtrl", ($rootScope, authFactory, postFactory) ->

    this.login = (provider) ->
      authFactory.login(provider).then (user) ->
        authFactory.createCurrentUser(user)

    return this
