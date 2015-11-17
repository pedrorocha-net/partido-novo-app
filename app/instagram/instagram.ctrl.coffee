'use strict'

instagramCtrl = (instagramFactory, $ionicLoading, $state) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando Fotos do instagram...'
  })

  instagramFactory.getRecentPosts().then ((data) ->
    vm.posts = data.data.data
    console.log(vm.posts)
    $ionicLoading.hide()
    ), (error) ->
      $ionicLoading.hide()
      $state.go 'about.partidonovo'

angular.module('app').controller 'instagramCtrl', instagramCtrl

instagramCtrl.$inject = ['instagramFactory', '$ionicLoading', '$state']
