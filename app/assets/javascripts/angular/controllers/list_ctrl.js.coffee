angular.module("hyperest")
  .controller "ListCtrl", (postFactory) ->

    _this = this

    postFactory.list().then (list) ->
      _this.list = list

    return _this
