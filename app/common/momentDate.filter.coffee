'use strict'

momentDate = ->
  (input) ->
    return moment.unix(input).format("DD/MM/YYYY");

angular.module('main').filter 'momentDate', momentDate
