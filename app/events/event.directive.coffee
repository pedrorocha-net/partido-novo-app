'use strict'
angular.module('main').directive 'event', ->
  {
    templateUrl: 'templates/events/event.directive.html'
    restrict: 'E'
    scope:
      titulo: '@'
      nome: '@'
      rua: '@'
      cidade: '@'
      bairro: '@'
      estado: '@'
      link: '@',
      inicio: '@'
      fim: '@'
      index: '@'
  }
