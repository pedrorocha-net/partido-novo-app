'use strict'

eventsCtrl = (EventsFactory, $scope, $ionicLoading, $state, $stateParams,GeoUtilsFactory, uiGmapGoogleMapApi, uiGmapIsReady) ->
  vm = this

  $scope.map =
    center:
      latitude: 37.78
      longitude: -122.41
    zoom: 14
    control: {}

  # uiGmapIsReady.then = (maps) ->
  #   $scope.map.control.refresh({latitude: $scope.map.center.latitude, longitude: $scope.map.center.longitude})

  $scope.seeLocation = (event) ->
    GeoUtilsFactory.getCoordinates(event).then (response) ->
      $scope.map.center.latitude  = response.data.results[0].geometry.location.lat
      $scope.map.center.longitude = response.data.results[0].geometry.location.lng
      $state.go('events.location')
    return

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

eventsCtrl.$inject = ['EventsFactory', '$scope', '$ionicLoading', '$state', '$stateParams', 'GeoUtilsFactory', 'uiGmapGoogleMapApi', 'uiGmapIsReady']
