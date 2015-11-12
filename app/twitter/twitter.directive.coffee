'use strict'
angular.module('app').directive 'twitter', ->
  {
    templateUrl: 'templates/twitter/twitter.directive.html'
    restrict: 'E'
    scope:
      twitt: '='

  }
