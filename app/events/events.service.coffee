
'use strict'

EventsFactory = ($http) ->
  @getEvents = () ->
    return $http.get('http://dev-partido-novo-app.pantheon.io/api/1/eventos/proximos')

  @openTicket = (url) ->
    window.open(url, '_system');

  return {
    getEvents: @getEvents,
    openTicket: @openTicket
  }

angular.module('main').factory 'EventsFactory', EventsFactory

EventsFactory.$inject = ['$http']
