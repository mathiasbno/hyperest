angular.module("hyperest")
  .controller "ListCtrl", (postFactory) ->
    this.list = postFactory.list()

    return this
