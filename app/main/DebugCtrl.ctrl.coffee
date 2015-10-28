'use strict'

DebugCtrl = () ->
  console.log 'Hello from your Controller: DebugCtrl in module main:. This is your controller:', this
    # bind data from services
  @someData = ''
  @ENV = ''
  @BUILD = ''
  # PASSWORD EXAMPLE
  @password =
    input: ''
    strength: ''

  @grade = ->
    size = @password.input.length
    if size > 8
      @password.strength = 'strong'
    else if size > 3
      @password.strength = 'medium'
    else
      @password.strength = 'weak'

  @grade()
  return
  
angular.module('main').controller 'DebugCtrl', DebugCtrl
