'use strict'

clippingCtrl = (clippingFactory, $ionicLoading) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando news...'
  })

  clippingFactory.getNews().then (res) ->
    vm.news = res.data;
    $ionicLoading.hide()

  return

angular.module('app').controller 'clippingCtrl', clippingCtrl

clippingCtrl.$inject = ['clippingFactory', '$ionicLoading']
