angular.module("hyperest").factory "authFactory", ($rootScope, $state, $firebaseSimpleLogin, FIREBASE_URL) ->
  firebaseRef = new Firebase FIREBASE_URL
  auth = $firebaseSimpleLogin(firebaseRef)

  factory = {}

  factory.auth = ->
    return auth.$getCurrentUser().then (user) ->
      if location.pathname != "/"
        document.location.href = "/"

        unless user == null
          factory.createCurrentUser(user)

  factory.login = (provider) ->
    return auth.$login("facebook",
      rememberMe: true,
      scope: 'email'
    )

  factory.logOut = ->
    auth.$logout()
    delete $rootScope.currentUser;
    $state.go 'home'

  factory.createCurrentUser = (user) ->
    $rootScope.currentUser = {
      email: user.thirdPartyUserData.email
      first_name: user.thirdPartyUserData.first_name
      last_name: user.thirdPartyUserData.last_name
      full_name: user.thirdPartyUserData.name
    }

  return factory
