angular.module("hyperest")
  .directive "contenteditable", ->
    restrict: "A",
    require: "ngModel",
    link: (scope, element, attrs, ngModel) ->

      read = ->
        ngModel.$setViewValue element.html()

      placeholder = ->
        if element.attr('placeholder')
          unless ngModel.$viewValue
            element.text(element.attr('placeholder'))
            element.addClass('placeholder')

          element.on 'focus', ->
            unless ngModel.$viewValue
              element.text('')
              element.removeClass('placeholder')

          element.on 'blur', ->
            unless ngModel.$viewValue
              element.text(element.attr('placeholder'))
              element.addClass('placeholder')

      ngModel.$render = ->
        element.html(ngModel.$viewValue || "")

        placeholder()


      element.bind "blur keyup change", ->
        scope.$apply read
