angular.module("hyperest")
  .directive "contenteditable", ->
    restrict: "A",
    require: "ngModel",
    link: (scope, element, attrs, ngModel) ->

      read = ->
        ngModel.$setViewValue element.html()

      ngModel.$render = ->
        element.html(ngModel.$viewValue || "")

      element.bind "blur keyup change", ->
        scope.$apply read
