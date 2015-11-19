'use strict'

clippingCtrl = (clippingFactory, $ionicLoading, $state, errorFactory) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando news...'
  })

  clippingFactory.getNews().then ((res) ->
    vm.news = res.data;
    $ionicLoading.hide()
  ), (error) ->
    $ionicLoading.hide()
    errorFactory.default()

  return

angular.module('app').controller 'clippingCtrl', clippingCtrl

clippingCtrl.$inject = ['clippingFactory', '$ionicLoading', '$state', 'errorFactory']
