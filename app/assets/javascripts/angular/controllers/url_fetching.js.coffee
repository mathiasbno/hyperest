angular.module("hyperest")
  .controller "UrlFetchingCtrl", ($scope, $http) ->

    this.fetchUrl = (url) ->
      regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
      valid_url = regexp.test(url)

      if valid_url == true
        $http.get(url)
          .success (data, status, headers, config) ->
            debugger
          .error (data, status, headers, config) ->
            debugger

    return this

