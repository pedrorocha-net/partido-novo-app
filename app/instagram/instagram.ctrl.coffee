'use strict'

instagramCtrl = (instagramFactory, $ionicLoading, $state) ->
  vm = this

  vm.oi = 'adsadssaad'

  $ionicLoading.show({
    template: 'Carregando Fotos do instagram...'
  })

  instagramFactory.getRecentPosts().then ((data) ->
    vm.posts = data.data.data
    $ionicLoading.hide()
    ), (error) ->
      $ionicLoading.hide()
      $state.go 'about.partidonovo'

  return

angular.module('app').controller 'instagramCtrl', instagramCtrl

instagramCtrl.$inject = ['instagramFactory', '$ionicLoading', '$state']
