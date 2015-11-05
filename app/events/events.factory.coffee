
'use strict'

eventsFactory = ($http, Config) ->
  @getEvents = () ->
    return $http.get(Config.ENV.api_eventosURl)

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

  @setSelectedEventLocation = (event) ->
    localStorage.removeItem 'SelectedEventLocation'
    localStorage.setItem 'SelectedEventLocation', JSON.stringify(event)
    return

  @getSelectedEventLocation = () ->
    event = localStorage.getItem('SelectedEventLocation') || ''
    if event != ''
      event = JSON.parse event
    event

  return {
    getEvents: @getEvents
    setEvents: @setEvents
    getEventsObject: @getEventsObject
    getEvent: @getEvent
    setSelectedEventLocation: @setSelectedEventLocation
    getSelectedEventLocation: @getSelectedEventLocation
  }

angular.module('app').factory 'eventsFactory', eventsFactory

eventsFactory.$inject = ['$http', 'Config']
