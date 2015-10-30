'use strict'
angular.module('main').directive 'openUrl', ->
  {
    restrict: 'A'
    link: (scope, element, attrs) ->
      element.bind 'click', () ->
        window.open(attrs.openUrl, '_system');
        return
      return

  }
