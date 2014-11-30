angular.module("hyperest")
  .controller "UrlFetchingCtrl", ($scope, $http, fileSaveFactory) ->

    _this = this
    _this.entry = {}

    _this.fetchUrl = (url) ->
      regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
      valid_url = regexp.test(url)

      if valid_url == true

        encoded_url = encodeURIComponent(url)

        $http.get("http://localhost:9292/scrape?url=#{encoded_url}")
          .success (data, status, headers, config) ->
            _this.entry = {}
            _this.entry = data
          .error (data, status, headers, config) ->

    $scope.filesSelected = (event) ->
      file = event.target.files[0]

      reader = new FileReader()
      reader.readAsDataURL(file)

      if _this.entry.image == undefined
        _this.entry.image = ""

      reader.onloadend = ->
        _this.entry.image = reader.result
        $scope.$apply()

    return _this
