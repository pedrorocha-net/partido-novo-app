
'use strict'

GeoUtilsFactory = ($http) ->
  GoogleApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address='

  @getCoordinates = (event) ->
    address = [
      event.endereco_nome
      event.endereco_rua
      event.endereco_bairro
      event.endereco_cidade
      event.endereco_estado
    ]

    address = address.join('+')

    return $http.get(GoogleApiUrl + address);


  return {
    getCoordinates: @getCoordinates
  }

angular.module('main').factory 'GeoUtilsFactory', GeoUtilsFactory

GeoUtilsFactory.$inject = ['$http']


