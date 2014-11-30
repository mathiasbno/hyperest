angular.module("hyperest")
  .directive "packery", ($rootScope) ->
    restrict: 'A',
    link: (scope, element, attrs) ->
      if packery == undefined || packery == null

        packery = new Packery(element[0].parentElement, {
          columnWidth: '.item',
          gutter: 10
        })

        packery.bindResize()
      else
        packery.appended(element[0])

      packery.layout()
