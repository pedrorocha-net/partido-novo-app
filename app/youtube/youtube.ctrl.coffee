'use strict'

youtubeCtrl = (youtubeFactory, $ionicLoading, $state, errorFactory) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando Videos...'
  })

  youtubeFactory.getVideos().then ((data) ->
    vm.videos = data.data.items;
    $ionicLoading.hide()
  ), (error) ->
      $ionicLoading.hide()
      errorFactory.default()

  return

angular.module('app').controller 'youtubeCtrl', youtubeCtrl

youtubeCtrl.$inject = ['youtubeFactory', '$ionicLoading', '$state', 'errorFactory']
