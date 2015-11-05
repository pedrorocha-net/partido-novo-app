
'use strict'

geoUtilsFactory = ($http) ->
  googleApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address='

  @getCoordinates = (event) ->
    address = [
      event.endereco_nome
      event.endereco_rua
      event.endereco_bairro
      event.endereco_cidade
      event.endereco_estado
    ]

    address = address.join('+')

    return $http.get(googleApiUrl + address);


  return {
    getCoordinates: @getCoordinates
  }

angular.module('app').factory 'geoUtilsFactory', geoUtilsFactory

geoUtilsFactory.$inject = ['$http']


