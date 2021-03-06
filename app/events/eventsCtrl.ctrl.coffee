'use strict'

eventsCtrl = (eventsFactory, $scope, $ionicLoading, $state, $stateParams, geoUtilsFactory, $cordovaCalendar, $http) ->
  vm = this
  vm.eventSelected = eventsFactory.getSelectedEventLocation()

  data =  {
    app_id: 'a60485b6-7c47-11e5-9f7a-a0369f2d9328',
    device_type: 1,
    included_segments: ["All"]
  }
  console.log('oi')
  $http.post('https://onesignal.com/api/v1/players', data).then (res) ->
    console.log(res)
    return

  $scope.seeLocation = (event) ->
    eventsFactory.setSelectedEventLocation(event)
    $state.go('events.location')
    refreshMap()
    return

  $scope.addToCalendar = (event) ->
    location = event.endereco_nome + '-' + event.endereco_rua + ',' + event.endereco_bairro + ',' + event.endereco_cidade + '-' + event.endereco_estado

    $cordovaCalendar.createEvent(
      title: event.titulo
      location: location
      notes: event.link_original
      startDate: moment.unix(event.data_inicio)._d
      endDate: moment.unix(event.data_termino)._d).then ((result) ->
      alert('evento adicionado com sucesso!')
      return
    ), (err) ->
      alert('nao foi possivel adicionar o evento!')
      return


  refreshMap = () ->
    $ionicLoading.show({
      template: 'Carregando Localizaçao...'
    })

    vm.eventSelected = eventsFactory.getSelectedEventLocation()
    console.log(vm.eventSelected)
    geoUtilsFactory.getCoordinates(vm.eventSelected).then (response) ->
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

    if eventsFactory.getEventsObject() == ''
      eventsFactory.getEvents().then (result) ->
        vm.events = result.data;
        eventsFactory.setEvents(result.data);
        $ionicLoading.hide()
        return
    else
      vm.events = eventsFactory.getEventsObject()
      $ionicLoading.hide()

  if $state.current.name == 'events.listDetail'
    id = $stateParams.id
    vm.eventSelected = eventsFactory.getEvent(id)
  return

angular.module('app').controller 'eventsCtrl', eventsCtrl

eventsCtrl.$inject = ['eventsFactory', '$scope', '$ionicLoading', '$state', '$stateParams', 'geoUtilsFactory',
  '$cordovaCalendar', '$http']
