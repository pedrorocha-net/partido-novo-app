'use strict'

momentHours = ->
  (input) ->
    return moment.unix(input).format("HH:mm");

angular.module('app').filter 'momentHours', momentHours
