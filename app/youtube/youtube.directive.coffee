'use strict'
angular.module('app').directive 'youtube', ->
  {
    templateUrl: 'templates/youtube/youtube.directive.html'
    restrict: 'E'
    scope:
      video: '='
  }
