'use strict'
angular.module('app').directive 'news', ->
  {
    templateUrl: 'templates/clipping/news.directive.html'
    restrict: 'E'
    scope:
      new: '='


  }
