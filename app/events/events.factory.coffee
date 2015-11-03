
'use strict'

EventsFactory = ($http) ->
  @getEvents = () ->
    return $http.get('http://dev-partido-novo-app.pantheon.io/api/1/eventos/proximos')

  @setEvents = (data) ->
    localStorage.setItem 'events', JSON.stringify(data)
    return

  @getEventsObject = () ->
    events = localStorage.getItem('events') || ''
    if events != ''
      events = JSON.parse events
    events

  @getEvent = (id) ->
    events = JSON.parse localStorage.getItem('events')

    for event in events
      if event.id == id
        return event;

  return {
    getEvents: @getEvents
    setEvents: @setEvents
    getEventsObject: @getEventsObject
    getEvent: @getEvent
  }

angular.module('main').factory 'EventsFactory', EventsFactory

EventsFactory.$inject = ['$http']
