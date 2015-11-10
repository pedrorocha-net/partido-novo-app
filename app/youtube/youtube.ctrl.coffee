'use strict'

youtubeCtrl = (youtubeFactory) ->
  vm = this

  youtubeFactory.getVideos().then (data) ->
    vm.videos = data.data.items;
    console.log vm.videos

  return

angular.module('app').controller 'youtubeCtrl', youtubeCtrl

youtubeCtrl.$inject = ['youtubeFactory']
