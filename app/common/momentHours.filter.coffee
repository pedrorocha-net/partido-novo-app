'use strict'

momentHours = ->
  (input) ->
    return moment.unix(input).format("HH:mm:ss");

angular.module('app').filter 'momentHours', momentHours
