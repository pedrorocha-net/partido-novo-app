'use strict'

eventsCtrl = (EventsFactory, $scope, $ionicLoading) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando eventos...'
  })

  if EventsFactory.getEventsObject() == ''
    EventsFactory.getEvents().then (result) ->
      vm.events = result.data;
      EventsFactory.setEvents(result.data);
      $ionicLoading.hide()
      return
  else
    vm.events = EventsFactory.getEventsObject()
    $ionicLoading.hide()

  return

angular.module('main').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['EventsFactory', '$scope', '$ionicLoading']
