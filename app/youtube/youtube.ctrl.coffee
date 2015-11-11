'use strict'

youtubeCtrl = (youtubeFactory, $ionicLoading) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando Videos...'
  })

  youtubeFactory.getVideos().then (data) ->
    vm.videos = data.data.items;
    $ionicLoading.hide()

  return

angular.module('app').controller 'youtubeCtrl', youtubeCtrl

youtubeCtrl.$inject = ['youtubeFactory', '$ionicLoading']
