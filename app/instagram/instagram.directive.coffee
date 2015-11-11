'use strict'
angular.module('app').directive 'instagram', ->
  {
    templateUrl: 'templates/instagram/instagram.directive.html'
    restrict: 'E'
    scope:
      post: '='
  }
