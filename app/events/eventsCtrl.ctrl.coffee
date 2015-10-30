'use strict'

eventsCtrl = (EventsFactory, $scope) ->
  vm = this

  EventsFactory.getEvents().then (result) ->
    console.log result.data;
    vm.events = result.data;
    console.log moment.unix(result.data[1].data_inicio);
    return

  return

angular.module('main').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['EventsFactory', '$scope']
