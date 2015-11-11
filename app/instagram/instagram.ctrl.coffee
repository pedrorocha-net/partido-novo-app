'use strict'

instagramCtrl = (instagramFactory, $ionicLoading) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando Fotos do instagram...'
  })

  instagramFactory.getRecentPosts().then (data) ->
    vm.posts = data.data.data
    $ionicLoading.hide()
  return

angular.module('app').controller 'instagramCtrl', instagramCtrl

instagramCtrl.$inject = ['instagramFactory', '$ionicLoading']
