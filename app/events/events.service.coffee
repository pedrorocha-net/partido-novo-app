
'use strict'

EventsFactory = ($http) ->
  @getEvents = () ->
    return $http.get('http://dev-partido-novo-app.pantheon.io/api/1/eventos/proximos')

  return {
    getEvents: @getEvents
  }

angular.module('main').factory 'EventsFactory', EventsFactory

EventsFactory.$inject = ['$http']
