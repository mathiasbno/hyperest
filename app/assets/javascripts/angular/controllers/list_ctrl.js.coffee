angular.module("hyperest")
  .controller "ListCtrl", (postFactory) ->

    this.fetcing = true

    postFactory.list().then (list) =>
      this.list = list
      this.fetcing = false

    return this
