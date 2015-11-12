'use strict'

twitterCtrl = ($cordovaOauth, Config) ->
  clientId = Config.ENV.twitterClientID
  clientSecret = Config.ENV.twitterClientSecret

  $cordovaOauth.twitter(clientId, clientSecret).then ((succ) ->
    $twitterApi.configure clientId, clientSecret, succ
    @test()
    return
  ), (error) ->
    console.log error
    return

  @test = () ->
    $twitterApi.getHomeTimeline(count: 5).then ((data) ->
      alert data
      return
    ), (error) ->
      console.log 'err: ' + error
      return
    return

  return


angular.module('app').controller 'twitterCtrl', twitterCtrl

twitterCtrl.$inject = ['$cordovaOauth', 'Config']
