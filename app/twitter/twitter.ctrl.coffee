'use strict'

twitterCtrl = (Config, $twitterApi) ->
  vm = this

  clientId = Config.ENV.twitterClientID
  clientSecret = Config.ENV.twitterClientSecret
  token  = Config.ENV.oAuthTokenTwitter
  user_id = Config.ENV.partidoNovoUserTwitterID


  $twitterApi.configure clientId, clientSecret, token


  $twitterApi.getUserTimeline(
    user_id: user_id
    count: 10).then ((data) ->
    vm.twitts = data
    console.log vm.twitts
    return
  ), (error) ->
    alert 'err: ' + error
    return

  return


angular.module('app').controller 'twitterCtrl', twitterCtrl

twitterCtrl.$inject = ['Config', '$twitterApi']
