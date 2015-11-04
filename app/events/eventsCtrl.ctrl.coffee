'use strict'

eventsCtrl = (EventsFactory, $scope, $ionicLoading, $state, $stateParams, GeoUtilsFactory, $location) ->
  vm = this

  $scope.seeLocation = (event) ->
    EventsFactory.setSelectedEventLocation(event)
    $state.go('events.location')
    refreshMap()
    return

  refreshMap = () ->
    $ionicLoading.show({
      template: 'Carregando Localizaçao...'
    })
    event = EventsFactory.getSelectedEventLocation()

    GeoUtilsFactory.getCoordinates(event).then (response) ->
      lat = response.data.results[0].geometry.location.lat
      lon = response.data.results[0].geometry.location.lng
      Latlng = new google.maps.LatLng(lat, lon)

      mapOptions =
        center: Latlng
        zoom: 16
        mapTypeId: google.maps.MapTypeId.ROADMAP


      map = new google.maps.Map(document.getElementById("map"), mapOptions)

      map.setCenter(new google.maps.LatLng(lat, lon))

      marker = new google.maps.Marker({
          position: new google.maps.LatLng(lat, lon)
          map: map
          title: ""
      })

      $scope.map = map
      $ionicLoading.hide()

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

eventsCtrl.$inject = ['EventsFactory', '$scope', '$ionicLoading', '$state', '$stateParams', 'GeoUtilsFactory', '$location']
