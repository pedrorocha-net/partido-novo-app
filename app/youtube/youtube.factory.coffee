
'use strict'

youtubeFactory = ($http, Config) ->
  @getVideos = () ->
    $http.get('https://www.googleapis.com/youtube/v3/search', params:
      key: Config.ENV.googleApiJsKey
      type: 'video'
      order: 'date'
      part: 'id,snippet'
      fields: '*'
      channelId: Config.ENV.partidoNovoChannelID)

  return {
    getVideos: @getVideos
  }

angular.module('app').factory 'youtubeFactory', youtubeFactory

youtubeFactory.$inject  = ['$http', 'Config']
