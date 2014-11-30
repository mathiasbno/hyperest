angular.module("hyperest")
  .controller "PostCtrl", (postFactory) ->
    this.post = (post) ->
      postFactory.create(post)

    return this
