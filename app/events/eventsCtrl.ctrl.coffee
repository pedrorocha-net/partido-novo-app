'use strict'

eventsCtrl = (EventsFactory, $scope, $ionicLoading, $state, $stateParams) ->
  vm = this


  if $state.current.name == 'events.list'
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

  if $state.current.name == 'events.listDetail'
    id = $stateParams.id
    vm.eventSelected = EventsFactory.getEvent(id)
  return

angular.module('main').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['EventsFactory', '$scope', '$ionicLoading', '$state', '$stateParams']
