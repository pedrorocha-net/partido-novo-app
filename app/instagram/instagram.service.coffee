
'use strict'

instagramFactory = ($http, Config) ->
  @getRecentPosts = () ->
    $http.get('https://api.instagram.com/v1/users/1099217885/media/recent/', params:
      client_id: Config.ENV.clientInstagramID
      count: 10)

  return {
    getRecentPosts: @getRecentPosts
  }

angular.module('app').factory 'instagramFactory', instagramFactory

instagramFactory.$inject = ['$http', 'Config']
