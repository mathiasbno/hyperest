angular.module("hyperest").factory "postFactory", ($firebase, FIREBASE_URL) ->
  firebasePostRef = new Firebase FIREBASE_URL + "/post"
  post = $firebase(firebasePostRef)

  factory = {}

  factory.list = ->
    post.$asArray().$loaded().then (list) ->
      return list

  factory.create = (object) ->
    post.$asArray().$add(object).then (ref, error) ->
      return ref.name()

  return factory
