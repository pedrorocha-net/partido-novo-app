'use strict'

run =  ($ionicPlatform) ->
    $ionicPlatform.ready ->
    # Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    # for form inputs)


      if window.cordova and window.cordova.plugins.Keyboard
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
      if window.StatusBar
    # Set the statusbar to use the default style, tweak this to
    # remove the status bar on iOS or change it to use white instead of dark colors.
        StatusBar.styleDefault()

      return
    return

angular.module('app').run(run)


