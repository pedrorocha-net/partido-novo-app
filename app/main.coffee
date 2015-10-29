'use strict'
angular.module('main', [
  'ionic'
  'ionic-material'
  'ngCordova'
  'ui.router'
]).config ($stateProvider, $urlRouterProvider) ->
  # ROUTING with ui.router
  $urlRouterProvider.otherwise '/main/list'

  $stateProvider.state 'main',
    url: '/main'
    abstract: true
    templateUrl: 'templates/tabs.html'
  .state 'main.list',
    url: '/list'
    views: 'tab-list':
      templateUrl: 'templates/list.html'
  .state 'main.listDetail',
    url: '/list/detail'
    views: 'tab-list':
      templateUrl: 'templates/list-detail.html'
  .state 'main.debug',
    url: '/debug'
    views: 'tab-debug':
      templateUrl: 'templates/debug.html'
      controller: 'DebugCtrl as ctrl'

