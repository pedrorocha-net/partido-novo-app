'use strict'

twitterCtrl = (Config, $twitterApi, $ionicLoading, $state, errorFactory) ->
  vm = this

  $ionicLoading.show({
    template: 'Carregando últimos twitts...'
  })

  clientId = Config.ENV.twitterClientID
  clientSecret = Config.ENV.twitterClientSecret
  token  = Config.ENV.oAuthTokenTwitter
  user_id = Config.ENV.partidoNovoUserTwitterID


  $twitterApi.configure clientId, clientSecret, token


  $twitterApi.getUserTimeline(
    user_id: user_id
    count: 10).then ((data) ->
    vm.twitts = data
    $ionicLoading.hide()
    return
  ), (error) ->
     $ionicLoading.hide()
     errorFactory.default()
    return

  return


angular.module('app').controller 'twitterCtrl', twitterCtrl

twitterCtrl.$inject = ['Config', '$twitterApi', '$ionicLoading', '$state', 'errorFactory']
