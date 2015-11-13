
'use strict'

clippingFactory = ($http, Config) ->
  api_url = Config.ENV.api_noticiasURl

  @getNews = () ->
    $http.get(api_url)

  return {
    getNews: @getNews
  }

angular.module('app').factory 'clippingFactory', clippingFactory

clippingFactory.$inject = ['$http', 'Config']
