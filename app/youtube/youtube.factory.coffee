
'use strict'

youtubeFactory = ($http) ->
  @getVideos = () ->
    $http.get('https://www.googleapis.com/youtube/v3/search', params:
      key: 'AIzaSyA5EciOz3qsV5Gvy4EiLOqvjLu4TvfWLmE'
      type: 'video'
      part: 'id,snippet'
      fields: '*'
      q: 'partidonovo500')

  return {
    getVideos: @getVideos
  }

angular.module('app').factory 'youtubeFactory', youtubeFactory

youtubeFactory.$inject  = ['$http']
