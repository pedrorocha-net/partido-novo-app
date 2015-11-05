'use strict'
angular.module('app').directive 'event', ->
  {
    templateUrl: 'templates/events/event.directive.html'
    restrict: 'E'
    scope:
      event: '='
      seeLocation: '&'
      addToCalendar: '&'

  }
