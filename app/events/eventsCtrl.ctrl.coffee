'use strict'

eventsCtrl = (EventsFactory) ->
  vm = this

  EventsFactory.getEvents().then (result) ->
    console.log result.data;
    vm.events = result.data;
    return

  return

angular.module('main').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['EventsFactory']
