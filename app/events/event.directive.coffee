'use strict'
angular.module('main').directive 'event', ->
  {
    templateUrl: 'templates/events/event.directive.html'
    restrict: 'E'
    scope:
      event: '='
      seeLocation: '&'

  }
