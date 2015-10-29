'use strict'

eventsCtrl = (EventsFactory) ->
  vm = this

  EventsFactory.getEvents().then (result) ->
    console.log result.data;
    vm.events = result.data;
    return

  vm.openTicket = (url) ->
    window.open(url, '_system');
    return

  return

angular.module('main').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['EventsFactory']
