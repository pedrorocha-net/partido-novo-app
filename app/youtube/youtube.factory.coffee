
'use strict'

youtubeFactory = ($http, Config) ->
  @getVideos = () ->
    console.log Config.ENV.googleApiJsKey
    $http.get('https://www.googleapis.com/youtube/v3/search', params:
      key: Config.ENV.googleApiJsKey
      type: 'video'
      order: 'relevance'
      part: 'id,snippet'
      fields: '*'
      q: 'partidonovo500')

  return {
    getVideos: @getVideos
  }

angular.module('app').factory 'youtubeFactory', youtubeFactory

youtubeFactory.$inject  = ['$http', 'Config']
