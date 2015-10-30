'use strict'

eventsCtrl = (EventsFactory, $scope, $ionicLoading) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando eventos...'
  })

  EventsFactory.getEvents().then (result) ->
    vm.events = result.data;
    $ionicLoading.hide()
    return

  return

angular.module('main').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['EventsFactory', '$scope', $ionicLoading]
