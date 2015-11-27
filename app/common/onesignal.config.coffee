document.addEventListener 'deviceready', (->
# Enable to debug issues.
  window.plugins.OneSignal.setLogLevel({logLevel: 4, visualLevel: 4})

  notificationOpenedCallback = (jsonData) ->
    console.log 'didReceiveRemoteNotificationCallBack: ' + JSON.stringify(jsonData)
    return

  window.plugins.OneSignal.init 'a60485b6-7c47-11e5-9f7a-a0369f2d9328', { googleProjectNumber: '656582740795' }, notificationOpenedCallback
  # Show an alert box if a notification comes in when the user is in your app.
  window.plugins.OneSignal.enableInAppAlertNotification true
  return
), false
