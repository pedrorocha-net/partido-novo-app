
'use strict'

errorFactory = ($state) ->

  redirectToHome  = () ->
    $state.go('about.partidonovo')

  @default = () ->
    alert 'Ops! Algo de errado aconteceu, você será redirecionado para a Home do app. Tente novamente mais tarde =)'
    redirectToHome()
    return


  return {
    default: @default
  }

angular.module('app').factory 'errorFactory', errorFactory

errorFactory.$inject = ['$state']


